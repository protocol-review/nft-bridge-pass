// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "openzeppelin-contracts/contracts/token/ERC721/extensions/IERC721Metadata.sol";
import "openzeppelin-contracts/contracts/utils/Strings.sol";

/**
 * @title IL1ERC20Bridge
 */
interface IL1ERC20Bridge {
    /**
     * @dev Deposit an amount of ETH to a recipient's balance on L2.
     * @param _to L2 address to credit the withdrawal to.
     * @param _l2Gas Gas limit required to complete the deposit on L2.
     * @param _data Optional data to forward to L2. This data is provided
     *        solely as a convenience for external contracts. Aside from enforcing a maximum
     *        length, these contracts provide no guarantees about its content.
     */
    function depositETHTo(
        address _to,
        uint32 _l2Gas,
        bytes calldata _data
    ) external payable;
}

interface INFTBridgePass {
    function l2TokenBridge() external view returns (address);
}

contract NFTBridgePass is IERC721Metadata, ERC721, INFTBridgePass {
    address public immutable override l2TokenBridge;

    uint256 public totalSupply = 0;

    constructor(address _l2TokenBridge) ERC721("NFT Bridge Pass", "NFTPASS") {
        l2TokenBridge = _l2TokenBridge;
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, IERC721Metadata)
        returns (string memory)
    {
        return Strings.toString(tokenId);
    }

    function mint(address to, uint32 _l2Gas)
        external
        payable
        returns (uint256 tokenId)
    {
        tokenId = ++totalSupply;

        _mint(to, tokenId);

        IL1ERC20Bridge(l2TokenBridge).depositETHTo{value: msg.value}(
            to,
            _l2Gas,
            ""
        );
    }
}
