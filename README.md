# LazarusVault: A Decentralized Dead Man's Switch

LazarusVault is a secure, non-custodial smart contract designed for **digital asset inheritance**. It ensures that your funds (ETH) are automatically made available to a chosen beneficiary if you, the owner, become inactive for a specific period.

---

## 💡 The Problem
Self-custody is a double-edged sword. If a wallet owner passes away or loses their private keys without a backup plan, their assets are locked forever on the blockchain. Traditional legal wills are often too slow or technically complex for the Web3 space.

## 🚀 The Solution
**LazarusVault** acts as an automated "inheritance vault." It relies on a "Heartbeat" mechanism:
1. The owner must periodically signal they are "alive" by calling a function.
2. If the owner fails to signal within the agreed timeframe, the contract assumes inactivity.
3. The designated beneficiary can then autonomously claim the assets.

---

## 🛠 Technical Architecture

- **Language:** Solidity ^0.8.0
- **Design Pattern:** Interface-based architecture for modularity and future upgrades.

### Core Features:
* **Gas-Optimized:** Uses `immutable` variables and `Custom Errors` to minimize transaction costs.
* **Pull over Push:** Implements the security best practice where the beneficiary must claim funds, preventing potential gas-limit attacks.
* **Security Modifiers:** Robust access control using `msg.sender` to prevent unauthorized interactions.

---

## 📖 Real-World Use Case: "The 6-Month Safety Net"

**Scenario:** Alice holds a significant amount of ETH. She wants her brother, Bob, to inherit her funds if she is unable to manage them.

1.  **Deployment:** Alice deploys `LazarusVault`, setting Bob's address as the `beneficiary` and the `heartbeatInterval` to 180 days. She deposits 5 ETH.
2.  **The Heartbeat:** Every few months, Alice calls the `ping()` function. This resets the timer back to 180 days.
3.  **The Trigger:** If 180 days pass without Alice calling `ping()`, the contract locks out any further reset attempts.
4.  **Claiming:** Bob calls the `execute()` function. The contract verifies the time elapsed and transfers the 5 ETH directly to Bob's wallet.

---

## 🔒 Security Measures
* **Reentrancy Protection:** The `execute()` function follows the *Checks-Effects-Interactions* pattern.
* **No tx.origin:** Authorization is strictly handled via `msg.sender` to prevent phishing attacks through malicious intermediate contracts.
* **Transparency:** All time-related data is public, allowing the beneficiary to monitor the vault's status easily.

---

## 📂 Project Structure
```text
├── src/                # Core Smart Contract implementation
├── interfaces/         # ILazarusVault.sol (Logic definitions)
├── libraries/          # Constants.sol (Gas-efficient custom errors)
├── components/abi/     # Exported ABI for Frontend integration
└── README.md           # Project documentation