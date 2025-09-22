### Updates
- 092125
  - Started tertiary script (in testing branch)
  - Finalized the script!
- 092025
  - Finished secondary script, which copies over all config files
  - Added helix themes, fixed secondary.sh
__

## Scripts explanation
- **Inital.sh**  
  Dependencies for the setup (For void linux)
- **Secondary.sh**  
  Config files to copy over. **This script edits /etc/, *please look over this script. Its tested but double check anyway***
- **Tertiary**  
  This script installed Arch and Debian stratum via docker and `brl import`. This script was tested in a Bedrock(voidlinux) virtual machine. ***But please look over this script regardles***
___
##### Todo
- [ ] Update all three after first version
- [ ] Add desktop and laptop configuration options.
  So that I can choose which setup I want
- [ ] Eventually combine all three scripts
- [x] Finish tertiary.sh
- [x] Explanation of intial, secondary, and tertiary scripts.
- [x] Add helix themes folder to git tree, and update secondary
