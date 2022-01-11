import React from 'react';
import ReactDOM from 'react-dom';

import 'react-toastify/dist/ReactToastify.min.css';
import './index.scss';
//import * as serviceWorker from './serviceWorker';

import {Route, Routes, BrowserRouter, useParams} from 'react-router-dom';
import {Drizzle, EventActions, generateStore} from "@drizzle/store";
import { toast } from 'react-toastify'

import CryptoLauncher from "./contracts/CryptoLauncher.json";
import Welcome from "./routes/Welcome";
import Loading from "./components/Loading";

const options = {
    contracts: [],
    web3: {
        fallback: {
            type: "ws",
            url: "ws://127.0.0.1:7545",
        },
    }
};

const contractEventNotifier = store => next => action => {
    if (action.type === EventActions.EVENT_FIRED) {
        const contract = action.name
        const contractEvent = action.event.event
        const message = action.event.returnValues._message
        const display = `${contract}(${contractEvent}): ${message}`

        toast.success(display, { position: toast.POSITION.TOP_RIGHT })
    }
    return next(action)
}
const appMiddlewares = [contractEventNotifier];

// setup the drizzle store and drizzle
const drizzle = new Drizzle(options, generateStore({
    options,
    appMiddlewares,
    disableReduxDevTools: false  // enable ReduxDevTools!
}));

window.ethereum.on('accountsChanged', function (accounts) {
    window.location.reload()
})

const Routing = (drizzle, drizzleState) => {
    return(
        <div className="App">
            <BrowserRouter>
                <Routes>
                    <Route path="/" element={<Welcome drizzle={drizzle} drizzleState={drizzleState} />}/>
                </Routes>
            </BrowserRouter>
        </div>
    )
}

console.log(drizzle)
drizzle.store.subscribe(() => {
    const drizzleState = drizzle.store.getState();

    if (drizzleState.drizzleStatus.initialized) {
        ReactDOM.render(
            Routing(drizzle, drizzleState),
            document.getElementById("root")
        );
    }
});

const FirstLoading = () => {
    return(
        <Loading loading={true} message={"Welcome to LowFee, please connect your wallet!"}/>
    )
}

ReactDOM.render(
    FirstLoading(),
    document.getElementById("root")
);