// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Spiderion Token (SPDR) with Ownership Shares Representation
 * @notice 
 *         This contract represents ownership shares for the Spiderion project.
 *         The token is NOT a cryptocurrency or digital currency, but a symbolic representation of ownership shares.
 *         The token represents a share for its holder in the Spiderion project funding.
 *         The initial price is set at 1 US Dollar (1 stable coin = 1 SPDR) during the direct sale phase.
 *         After the sale, the price will remain fixed based on the initial price.
 *         
 *         This token does not function as a currency, but as a share of ownership in the project,
 *         giving its holder rights as an investor in the funding of the Spiderion project.
 *         
 *         Note: This token is intended for investment purposes only and is a share representation, not a digital currency.
 *         
 *         Open Source: This contract is open-source and can be freely accessed and modified.
 *         It is licensed under the MIT License, which allows for usage, modification, and distribution of this contract's code.
 *
 *         Spiderion is a custom-built system developed by the team at www.aioneum.com.
 *         This system represents a decentralized ownership model and is designed for the funding and growth of the Spiderion project.
 *         For more information, visit the official website www.aioneu.com.  
 */
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SpiderionToken is ERC20, Ownable {
    uint256 public constant INITIAL_SUPPLY = 1000000 * (10 ** 18);
    uint256 public constant TOKEN_PRICE = 1 * (10 ** 18);
    address public fundingWallet;
    bool public saleActive = true;

    event TokensPurchased(address indexed buyer, uint256 amount, uint256 cost);
    event SaleStatusChanged(bool newStatus);

    /**
     * @dev Constructor now passes initialOwner to Ownable
     * @param _fundingWallet Address where sale funds will be sent
     */
    constructor(address _fundingWallet) ERC20("Spiderion", "SPDR") Ownable(_fundingWallet) {
        require(_fundingWallet != address(0), "Invalid funding wallet address");
        fundingWallet = _fundingWallet;
        _mint(_fundingWallet, INITIAL_SUPPLY);
    }

    // ... rest of the contract remains the same ...
}
