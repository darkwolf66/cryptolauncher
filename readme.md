# CryptoLauncher a low fee token launcher

Cryptolauncher is a fork from the [LowFee](https://github.com/darkwolf66/lowfee) project who envision to give access to a secure BEP20/ERC20 token launcher with no need for code integration and open source. We believe by giving power to people to launch their own tokens without bureaucracy or high fees we give a next step into the crypto economy.

What about you be part of this crypto revolution, either by supporting or using it.

## FAQ

#### What are the networks allowed?

Currently we have it limited to BSC as we are developing a minimum usable version.

#### Can I help on the project?

Certainly! we are open to contributions with the reward of becoming a contributor

#### What stage is the project at?

Project is still trying to react a minimum viable version, we will launch it live soon that is ready.

#### Why should I care?

In the end of the day doesn't really matter, the point of the project is to help people who will identify with the lack of safe and cheap solutions while trying to launch their projects.
## Roadmap

✔️ Finish the main features (Launch Token and List Launched Tokens)

➖ Polish UI/UX

➖ Launch the project live
## Demo

The demo is comming soon we have the minimum amount of secure and usable features!


## Installation Development Env

The project is divided in 2 main folders
- /cryptolauncher (Folder for the truffle)
- /cryptolauncher/client (Folder for the react)


#### Preparing Truffle /cryptolauncher
First you need to go to the cryptolauncher folder and run the npm install
```bash
  cd cryptolauncher
  npm install
```
With that done you can go to the cryptolauncher/config.js and edit the truffle-config.js setting up the truffle as you want or keeping as the default.
Next you need to run ```truffle develop``` to start using it.

Before running compile and migrate inside the truffle console, you need to go on the /cryptolauncher/contracts
and setup a few stuff here:

#### On /cryptolauncher/contracts/CryptoLauncher.sol
Change the _owner to your wallet who is going to be used as admin.
You can set the _platformFee to what you believe is a fair fee.

Remember to run the compile and migrate before start using it. And keep it running while developing.

#### Preparing React /cryptolauncher/client
Now make sure you opened a new terminal while truffle is running and you can do
```bash
  cd cryptolauncher/client
  npm install
```
After that you can check the /cryptolauncher/client/src/index.js where you can set the config for web3, drizzle, truffle and other stuff.

## Authors

- [@darkwolf66](https://www.github.com/darkwolf66)


## Support

For support, email you can contact will.moraes.96@gmail.com.
## Our Funding

Our project have zero funding! Made from a Developer for people who need it.
## Optimizations

Will be nice to have a UI/UX designer going thought the layouts and optimizing/re-designing.
## License

[MIT](https://choosealicense.com/licenses/mit/)

