# Force compile
compile:; forge build --force

compile-log:; forge build --names

clean:; forge clean

test:; forge test 

test-log:; forge test -vvv

test-trace:; forge test -vvvv

test-gas-report:; forge test --gas-report -vvv

test-match:; forge test --match-contract $(contract) -vvvv

test-match-test:; forge test --match-test $(test) -vvvv

# Deployments
deploy-contract:; 
	forge create $(contract) \
	--constructor-args $(constructorArgs) \
	--rpc-url $(url) \
	--private-key $(privateKey)


# Verification
verify-contract:; 
	forge verify-contract \
	--chain-id $(chainId) \
	--constructor-args `cast abi-encode "$(constructorSig)" $(constructorArgs)` \
	--compiler-version $(compilerVersion) \
	--num-of-optimizations 200 \
	$(address) \
	$(contract) \
	$(apiKey) 
