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

## How to Test

After setting up the iptables rules, it's crucial to test their effectiveness. A simple method of testing involves simulating a Denial of Service attack against your own server. Below is a basic C# script that sends UDP packets to a given IP address. This can be used to test the vulnerability of your server before and after implementing the iptables rules:

```csharp
using System.Net;
using System.Net.Sockets;

using var udpClient = new UdpClient();

var destinationAddress = IPAddress.Parse("200.79.187.230");
var endPoint = new IPEndPoint(destinationAddress, 27015);

var emptyData = new byte[28];

while (true)
    udpClient.Send(emptyData, emptyData.Length, endPoint);
```

⚠️ **Disclaimer**: The above script and any other testing tools should **ONLY** be used on servers and networks you have permission to test. Misusing these tools can lead to severe consequences.

Additionally, there are various online services available that can perform stress tests on your server. One such service is [stresser.st](https://stresser.st/). This service, among others, offers both paid and free versions for stress testing. 

⚠️ **Caution**: Always ensure you have the proper permissions and rights to conduct such tests. It's illegal to perform Denial of Service attacks or any form of cyber-attacks on servers without explicit permission.

Remember that ethical behavior is crucial when dealing with potential vulnerabilities. Always use these tools responsibly.

## Handling DDoS Attacks

In situations where you're facing a Distributed Denial of Service (DDoS) attack, the protection mechanisms differ significantly from those for a simple DoS attack.

1. **Professional DDoS Protection Services**: There are specialized services available that focus exclusively on detecting and mitigating DDoS attacks. Employing such a service can be beneficial if you're facing regular and sophisticated DDoS threats.

2. **Cloud Provider Network Configurations**: If you're hosting your server on a cloud platform, they often provide network security configurations that can be tailored to defend against DDoS. For instance, Microsoft Azure offers a feature known as "Network security group". This allows administrators to specify which IP addresses are permitted or denied access to their server. By setting up rules that filter out malicious or unwanted traffic, you can significantly enhance your server's resilience against DDoS attacks.

However, setting up these network security rules, especially in cloud environments, can be intricate and requires a deep understanding of the platform and its security features. It's important to understand that such configurations are more advanced and fall outside the scope of this repository.

We recommend seeking expertise or consulting the documentation of your specific cloud provider if you're considering implementing such measures.

## References
- [Hardening SRCDS with iptables rules](https://forums.alliedmods.net/showthread.php?t=151551)
- [[L4D2] Servers are heavily vulnerable to empty UDP packet DOS attacks #5141](https://github.com/ValveSoftware/Source-1-Games/issues/5141)
- [DoS-Protect_SM](https://github.com/cravenge/DoS-Protect_SM)
- [100% CPU usage and low tickrate after hours of server usage #665](https://github.com/SirPlease/L4D2-Competitive-Rework/issues/665)

## Contributing
If you have suggestions or improvements, please open an issue or submit a pull request.

## License
This project is licensed under the MIT License. See the `LICENSE` file for more details.
