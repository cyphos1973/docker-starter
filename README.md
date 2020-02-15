#Docker-starter without symfony
Docker-starter is a reference app created to show how create the containers easier.

![alt text](phpinfo.png?raw=true "Default page")
## Instalaltions instructions
### Project requirements
- apache (latest version)
- mysql (latest version)
- php : 7.1.33 (value default in Dockerfile but you can choose it in .env)
- phpmyadmin (latest version)
- composer : 1.9.3
- yarn : 1.21.1
- portainer
- maildev (not verified)
- redis (not verified)
- centrifugo (not verified)
- rabbit (not verified)

### Installation
1 . Clone the current repository:
```bash
$ git clone git@github.com:cyphos1973/docker-starter.git
```
2. Enter in the directory
```bash
$ cd docker-starter
```
3. Execute these commands below into your working folder to install the project: (see Makefile)
```bash
$ make install
```

## Usage
1. Open the navigator (Google Chrome or Firefox or Safari)
2. Write :
```bash
$ https://localhost
```
## Contribution
Contribution are always welcome and recommended! Here is how:
1. Fork the repository (here is the guide).
2. Clone to your machine git clone https://github.com/YOUR_USERNAME/docker-starter.git
3. Create a new branch
4. Make your changes
5. Create a pull request