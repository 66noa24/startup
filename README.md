### ==Updates==
- 092125
  - Started tertiary script (in testing branch)
  - REmoved tertiary script from master
- 092025
  - Finished secondary script, which copies over all config files
  - Added helix themes, fixed secondary.sh
__

## Scripts explanation
- **Inital.sh**  
  Dependencies for the setup (For void linux)
- **Secondary.sh**  
  Config files to copy over. **This script edits /etc/, *please look over this script. Its tested but double check anyway***
- **Tertiary (*Un-done*)**  
  This script *will* be bedrock linux stuff. Docker commands to import debian/arch/other systems easier.
  *Not Done*
___
##### Todo
- [ ] Update all three after first version
- [ ] Add desktop and laptop configuration options.
  So that I can choose which setup I want
- [ ] Eventually combine all three scripts
- [x] Explanation of intial, secondary, and tertiary scripts.
- [x] Add helix themes folder to git tree, and update secondary
