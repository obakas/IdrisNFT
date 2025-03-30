# IdrisNFT

## Overview
**IdrisNFT** is an **ERC721-compliant** smart contract that allows users to mint unique **Non-Fungible Tokens (NFTs)** on the **Ethereum blockchain**. Each NFT is assigned a unique token URI that stores metadata associated with the token, such as images, descriptions, and attributes.

## Key Features
- **ERC721 Standard**: Fully implements the **ERC721 standard** for NFTs.
- **Custom Metadata**: Each NFT has a unique **tokenURI** mapped to it.
- **Simple Minting**: Users can mint new NFTs by providing a metadata URI.
- **Secure and Transparent**: Built using **OpenZeppelin**'s **ERC721** implementation.

## Technologies Used
- **Solidity 0.8.28**
- **OpenZeppelin ERC721**
- **Ethereum Blockchain**

## Contract Layout
The contract follows Solidity best practices:
1. **Version Declaration**
2. **Imports** (OpenZeppelin's ERC721 contract)
3. **State Variables** (Tracking token count and metadata mapping)
4. **Constructor** (Sets the NFT collection name and symbol)
5. **Functions**
   - **mintNFT()**: Mints a new NFT with a given metadata URI
   - **tokenURI()**: Retrieves the metadata URI for a given token

## How It Works
### 1. **Minting an NFT**
Users can mint an NFT by calling the `mintNFT()` function and passing a **tokenURI** (a link to the metadata stored off-chain, e.g., on **IPFS** or **Arweave**). The function:
- Assigns the URI to the new token.
- Mints the token to the caller's address.
- Increments the token counter.

### 2. **Retrieving NFT Metadata**
The **tokenURI(uint256 tokenId)** function returns the metadata URI associated with a specific token, allowing front-end applications and marketplaces to fetch and display NFT details.

## Deployment
To deploy this contract:
1. Use **Hardhat**, **Foundry**, or **Remix**.
2. Ensure OpenZeppelin’s **ERC721** contract is installed.
3. Deploy on **Ethereum**, **Polygon**, or any EVM-compatible blockchain.

## Example Usage
### Minting an NFT
```solidity
contractInstance.mintNFT("https://ipfs.io/ipfs/Qm.../metadata.json");
```

### Retrieving Metadata URI
```solidity
contractInstance.tokenURI(0); // Returns "https://ipfs.io/ipfs/Qm.../metadata.json"
```

## Future Enhancements
- Implement **burn function** for token destruction.
- Add **whitelist minting** for exclusive NFT drops.
- Integrate with **Chainlink VRF** for random NFT traits.

## Security Considerations
- Uses **_safeMint()** to prevent unintended transfers.
- Implements **best Solidity practices** for gas efficiency.
- Ensures **token metadata cannot be modified post-minting**.

## Conclusion
**IdrisNFT** provides a simple and efficient way to mint NFTs on the Ethereum blockchain. It follows **ERC721 standards**, ensuring compatibility with NFT marketplaces like **OpenSea** and **Rarible**. 🚀

