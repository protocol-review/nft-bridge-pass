# Foundry Template

## Table of Contents  
- [Set Up](#setup)  
- [Testing](#testing)  

<h2>
<a name="setup"/>
Setup
</a>
</h2>

### Install Foundry
See the [Foudry Github](https://github.com/gakonst/foundry#installation) repo for installation.

### Set up remappings
```
forge remappings > remappings.txt
```

### Set up env
```
cp .env.example .env
```

Update `.env` to include all variables.

### Compile files
```
make build
```

<h2>
<a name="testing"/>
Testing
</a>
</h2>

To run all tests

```
make test
```

To run tests with logs
```
make test-log
```

To run tests with gas report
```
make test-gas-report
```

To run a specific test suite
```
make test-match contract=${contract-name}
```

To run a specific test 
```
make test-match-test test=${function-name}
```


