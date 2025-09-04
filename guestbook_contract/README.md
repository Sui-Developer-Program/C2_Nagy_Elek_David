# 📦 Installation & Setup

## Prerequisites
- Node.js 18+
- Sui CLI - [Installation Guide](https://docs.sui.io/guides/developer/getting-started/sui-install)
- Git
- Testnet SUI tokens - [Get from Faucet](https://faucet.sui.io/)

## Create a SUI wallet
1. **Create a new address:**
```bash
sui client new-address ed25519 guestbook
```

2. **Show addresses:**
```bash
sui client show addresses
```

3. **Switch to guestbook address:**
```bash
sui client switch-address guestbook
```

4. **Check balance:**
```bash
sui client balance
```

5. **Get from Faucet:**
    [Get from Faucet](https://faucet.sui.io/)


## Smart Contract Setup

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

4. **Note the Package ID and GuestBook object ID** for frontend configuration
