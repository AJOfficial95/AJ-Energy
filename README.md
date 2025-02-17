# Sneak Energy Items for QBCore

This is a collection of items based on the **Sneak Energy** brand, integrated into the **QBCore** framework for GTA V roleplay servers. The items have custom images and can be used in your inventory system.

## Features
- **Sneak Energy Items**: A variety of energy drink flavours with custom images.
- **Easy Integration**: Follow the steps below to integrate them into your server.

## Installation

### 1. Add the Items to `qbcore/shared/items.lua`

Copy and paste the following items into your `qbcore/shared/items.lua` file:

```lua
-- Sneak Energy Items
QBCore.Shared.Items = {
    sneak_energy_stealth = { name = 'sneak_energy_stealth', label = 'Stealth', weight = 50, type = 'item', image = 'stealth.png', unique = false, useable = true, shouldClose = true, description = 'A cool, refreshing flavour from Sneak Energy.' },
    sneak_energy_blueraspberry = { name = 'sneak_energy_blueraspberry', label = 'Blue Raspberry', weight = 50, type = 'item', image = 'blueraspberry.png', unique = false, useable = true, shouldClose = true, description = 'A sweet, tangy blue raspberry flavour from Sneak Energy.' },
    sneak_energy_strawberrywatermelon = { name = 'sneak_energy_strawberrywatermelon', label = 'Strawberry Watermelon', weight = 50, type = 'item', image = 'strawberrywatermelon.png', unique = false, useable = true, shouldClose = true, description = 'A fruity mix of strawberry and watermelon from Sneak Energy.' },
    sneak_energy_strawberrymillions = { name = 'sneak_energy_strawberrymillions', label = 'Strawberry Millions', weight = 50, type = 'item', image = 'strawberrymillions.png', unique = false, useable = true, shouldClose = true, description = 'A nostalgic strawberry millions flavour from Sneak Energy.' },
    sneak_energy_bubblegummillions = { name = 'sneak_energy_bubblegummillions', label = 'Bubblegum Millions', weight = 50, type = 'item', image = 'bubblegummillions.png', unique = false, useable = true, shouldClose = true, description = 'Bubblegum flavour with a twist of Millions candy.' },
    sneak_energy_purplestorm = { name = 'sneak_energy_purplestorm', label = 'Purple Storm', weight = 50, type = 'item', image = 'purplestorm.png', unique = false, useable = true, shouldClose = true, description = 'A tangy, stormy purple flavour from Sneak Energy.' },
    sneak_energy_tropikilla = { name = 'sneak_energy_tropikilla', label = 'Tropikilla', weight = 50, type = 'item', image = 'tropikilla.png', unique = false, useable = true, shouldClose = true, description = 'A tropical, fruity flavour from Sneak Energy.' },
    sneak_energy_cherrybomb = { name = 'sneak_energy_cherrybomb', label = 'Cherry Bomb', weight = 50, type = 'item', image = 'cherrybomb.png', unique = false, useable = true, shouldClose = true, description = 'A bold cherry flavour with a blast of energy.' },
    sneak_energy_sourapple = { name = 'sneak_energy_sourapple', label = 'Sour Apple', weight = 50, type = 'item', image = 'sourapple.png', unique = false, useable = true, shouldClose = true, description = 'A sour apple flavour for an extra kick.' },
    sneak_energy_neonpunch = { name = 'sneak_energy_neonpunch', label = 'Neon Punch', weight = 50, type = 'item', image = 'neonpunch.png', unique = false, useable = true, shouldClose = true, description = 'A neon punch of flavour from Sneak Energy.' },
    sneak_energy_grapecrush = { name = 'sneak_energy_grapecrush', label = 'Grape Crush', weight = 50, type = 'item', image = 'grapecrush.png', unique = false, useable = true, shouldClose = true, description = 'A refreshing grape flavour from Sneak Energy.' }
}
2. Add the Images to Your Inventory Script
Create a Folder for Images: Create a new folder in your inventory script directory (usually qb-inventory or wherever your inventory system is located). Place the images in the html/images/sneak_energy/ directory.

Example folder structure:

swift
Copy
Edit
qb-inventory/html/images/sneak_energy/
Add the Images: Copy the following images from your local images folder and place them in the newly created folder (sneak_energy):

stealth.png
blueraspberry.png
strawberrywatermelon.png
strawberrymillions.png
bubblegummillions.png
purplestorm.png
tropikilla.png
cherrybomb.png
sourapple.png
neonpunch.png
grapecrush.png
Update Inventory Script: In your inventory HTML or Lua files, ensure that the images are properly referenced. If your system dynamically loads item images, it should already recognize the items. If not, manually update the code to reference the images like this:

html
Copy
Edit
<img src="images/sneak_energy/stealth.png" alt="Stealth" />
Or, in Lua:

lua
Copy
Edit
item.image = 'images/sneak_energy/stealth.png'
3. Restart Your Server
After completing the above steps, restart your server for the changes to take effect. The Sneak Energy items should now be available in your inventory system, complete with custom images.

Troubleshooting
Images not loading: Double-check the image file names and ensure they match exactly with the references in your items.lua.
Items not appearing in inventory: Make sure the items.lua modifications are properly integrated into the qbcore framework and that your inventory system is set up to dynamically load items.