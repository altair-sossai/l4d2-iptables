# Left 4 Dead 2 - Anti-DoS `iptables` Rules

This repository provides a script, `rules.sh`, containing iptables rules tailored to mitigate Denial of Service (DoS) attacks on a Left 4 Dead 2 server.

## ⚠️ Important Notes
- **DoS vs DDoS**: This script is intended to help protect against DoS attacks, not Distributed Denial of Service (DDoS) attacks. Protection against DDoS requires more sophisticated measures and might be dependent on your network/hardware configuration.
  
- **Ensure It's a DoS**: Before implementing these rules, be certain you're dealing with a DoS attack and not a server configuration issue. A poorly configured server might show symptoms similar to an attack. More details on this can be found [here](https://github.com/SirPlease/L4D2-Competitive-Rework/issues/665).

## How to Execute `rules.sh`

1. Clone this repository:
   ```bash
   git clone https://github.com/altair-sossai/l4d2-iptables.git
   ```

2. Navigate to the directory:
   ```bash
   cd l4d2-iptables
   ```

3. Make the script executable:
   ```bash
   chmod +x rules.sh
   ```

4. Execute the script with superuser privileges:
   ```bash
   sudo ./rules.sh
   ```

## Recommendations
- Always backup your existing iptables rules before making any changes.
- Test these rules in a staging environment before deploying them to a production server.
- Periodically review and update your iptables rules as threat landscapes and server configurations evolve.

## References
- [AlliedMods Forum Discussion](https://forums.alliedmods.net/showthread.php?t=151551)
- [ValveSoftware/Source-1-Games Issue](https://github.com/ValveSoftware/Source-1-Games/issues/5141)
- [L4D2-Competitive-Rework Issue](https://github.com/SirPlease/L4D2-Competitive-Rework/issues/665)

## Contributing
If you have suggestions or improvements, please open an issue or submit a pull request.

## License
This project is licensed under the MIT License. See the `LICENSE` file for more details.
