# 📦 Installation & Setup

## Prerequisites
- Node.js 18+
- Sui CLI - [Installation Guide](https://docs.sui.io/guides/developer/getting-started/sui-install)
- Git
- Testnet SUI tokens - [Get from Faucet](https://faucet.sui.io/)


### Smart Contract Setup

1. **Clone and navigate to contract:**
```bash
cd guestbook_contract
```

2. **Test the contract:**
```bash
sui move test
```

3. **Deploy to testnet:**
```bash
sui client publish --gas-budget 20000000
```
