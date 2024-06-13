# Untouched

UNTOUCHED is a hack-and-slash, samurai inspired typing game about a samurai that has never been hit, where you'll have to prove how long you're able to stand enemy waves coming towards you.
Made with Godot Engine.
Developed by @hachatml.

## Index
1. [Original GDD](#introduction)
2. [Game Functionalities](#game-description)
3. [Installing](#installing)
4. [Usage](#usage)
5. [Development Diary](#development-diary)
6. [Testing](#testing)
7. [Distribution](#distribution)
8. [Game Manual](#game-manual)
9. [Conclussions](#conclussions)
10. [Credits](#credits)
## Introduction

### Game summary

Untouched is an infinite lineal and static fighting game about a samurai that has never been hit.

### Inspiration

#### One Finger Death Punch             ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ‎ ![](https://lh7-us.googleusercontent.com/docsz/AD_4nXfFNAZg9R_pSIKpxQtKrxwydaAE7Cok21IaPOi4oia8P7KRs3cd4V279FIsl9mrq0v8htoThRc9nrIfVOdDD0zIpwVmi5JcL9kNkM2D4oolnNAiyLJ_RSlPtxd3euob7co271TVPQJ6Pl7B6migR_OxuzmV?key=fiG_PzcXrBJad0r546gIkA)

[OFDP](https://store.steampowered.com/app/980300/One_Finger_Death_Punch_2/) being the only real inspiration of this game, has greatly influenced its idea, from static gameplay to the infinite enemy source, with certain requirements to be killed.

#### One Ronin

I found[One Ronin](https://dani567.itch.io/one-ronin) searching for assets that fueled my initial idea, and it has been what has shaped it in the end. This game is not even done, the user sold its assets in case someone wanted to finish it.

![](https://lh7-us.googleusercontent.com/docsz/AD_4nXcKhAoKo34rW3CN_gV9NQ5ZUv8j9aJscG4VSJqyVylWEfvUugZm0113RAML4iBXYk4t33ooDlW_4RdvIha6MA7onAtNTSdhv1RUnXlhlgVNZ_UVfDUqLdhDwYKUehZ4k61dE7WqD04I5bOmeDlwC-7ZEyAX?key=fiG_PzcXrBJad0r546gIkA)

  

### UX (User Experience)

The user will find itslef in a static place where he has to defeat all the enemies he can before being hit. Upon reaching certain kills, he'll start getting upgrades.

 
### Platforms

Mainly, Windows y Linux PC. Future exports to Mobile, Web, and Mac available.

### Tools

-   Engine: Godot 4.2.1
    
-   Art: Aseprite
    
-   Audio editing: Ableton & Audacity
    
-   Interface Design: Figma
   

### Genre

Singleplayer, Acción, Casual, Arcade

### Target Audience
 
 As an infinite score game, this game can range from casual players to the most expert ones, but centered about a younger audience since it's a high-paced game.

## Concept

### Gameplay Analisis

The player controls a static Samurai who will die at the first hit it recieves. Infinite enemy waves will come to him, and he should defeat them with WASD and Arrow Keys. Upon reaching certain eliminations, they can decide between some upgrades.
 
### Theme (Keep fighting)

  
A concept coming from Samurai times, "Fight no matter the difficulties that are presented to you". In this game, the main character will have to fight no matter the number of enemies that comes for him, until his last breath.  

### Mecanics

#### Augments  

After a number of eliminations, 3 options will be presented upon the player, where he can choose one. This will change the players' attack, abilities, or the gameplay loop itself.
#### Inspiration
Vampire Survivors
![](https://lh7-us.googleusercontent.com/docsz/AD_4nXekDkxAhLOcG1cDR4Lhl2BODHAIeG0636s1NUBqFof8f1fyabbtn-QDjAE1DD1HtVQFwxVL1uldwi3kLn0pwKrJD3nP-1tH_qrAMXAXx4Pfjyuq079uaU-1SLKHhvUGIhjQf82xB94AT58MxXD8jZY3UTP7?key=fiG_PzcXrBJad0r546gIkA)


#### Weak Points

Enemies must be killed with different keys each time (“Arrow Keys” or “WASD”)

#### Inspiration

![](https://lh7-us.googleusercontent.com/docsz/AD_4nXcjiM7bNsyMK0WLCB4hIrXj9CauWYF8g64lu9xaVD7qLtewr4Wsb4G7WocEqDMAXEQ4jC00RU14xzR9DDTqBbidCGl7olYajFGnC4rj3LGgddgUu3DwTfo4bDPsucHEyBlOTr5NqM4G2-P0RQTXtojXF7I?key=fiG_PzcXrBJad0r546gIkA)

Typing Terror (Neopets)

## Art

### Aesthetic
  
To keep a clean and calling aesthetic, elegant colors will be used, being only changed to stronger colors when special attention required.
  
### Design
The Design must mantain the style of a samurai throughout the game.

## Audio

### Music
The background music will use classic oriental rythms with an upbeat tempo,  matching the pacing of the game.[Reference](https://www.youtube.com/watch?v=IjXF27O4CWk).

### SFX

Being a unique gameplay loop, where events can happen over and over again, SFX must be few and strategically placed, so the game feels alive, but sounds don't feel repetitive and overwhelming. 

## Game Experience

### UI

While the game must be simple and elegant, the menus can take up the freedom to be a little more artsy, to cause a better impression. 
### Controls
#### Keyboard
Arrow keys / WASD
## Game Description

Untouched is a full-fledged game, playable for as long as the player wants to. Personally, I'm pretty satisfied with how the project has turned out within this time frame.

### Functionalities
The game has:
- A main menu
- An options Menu
- A credits page
- An initial lore cinematic
- An infinite gameplay Loop
- 4 different enemies
- 6 unique player upgrades
- A game over screen
- A highscore system, saved within the user's filesystem.
Apart from here, the existent project descriptions matches greatly the idea described on the GDD.



### Overall player experience
The game transmits a calm ambience from the start, but a fast-paced one once the main loop starts.

Unt5
Unt5
## Installing

### Game Engine
This project was developed using Godot Engine as explained before, so it's required to keep working on it. 

The project structure is explained further in the `Functional Design` file.

[Downloading Godot](https://godotengine.org) is pretty straightforward and lightweight.

After that, we just need to open the project folder within the Project Manager.

### Sprites
To further convenience editing the sprites, Aseprite/LibreSprite is recommended, since the original files are on .ase .aseprite files.

## Usage

To use this project, the concept of scenes and scripts in Godot must be understood.
### Scenes

Godot projects are based on __scenes__. Here, manageable parts of the game are created, like a character, an enemy, a menu... etc.
A scene can be implemented into other ones to create a wider player experience.

### In the project
The project features __25__ scenes.
The main and more complex ones will be the ones explained, since the other ones are pretty self explanatory.
#### Augment Screen
This one includes three times the Augment Card scene, and lets the player select an Augment/Upgrade. The biggest node is a Control one (made for UI) so it follows expanding rules by anchors.
#### Mushroom Enemy/MainChar
Heredated from CharacterBody, these scenes includes characters with collision, audio, and sprites included within itself.
#### Main Menu
This has three smaller control nodes, that has the title screen, the buttons will just hide the other ones and show the one desired.
#### Forest Scene
The main scene where the action happens. It includes things like the background, an enemySpawner scene instance, some limiting collisions and the main characters

## Scripts
Using a dedicated language from it heredated from Python (GDScript), Godot Scripts can be attached to every Node. These are key elements for the functioning of every game.

### In the project
The project features __25__ scripts (pure casualty lol)
Every script features inline comments where needed that explain the function of each script, so no further explanation is needed here.
## Development Diary

The specific changes made to the project over time can be seen on the Commit History. Regardless, I wanted to classify the development in some phases and make some annotations.

For reference, the first commit was made on 11th March 2024
### Initial Phase (1st month)

The starting part consisted of me figuring out in which direction I wanted the project to head on. It also included basic Godot work like creating a folder hierarchy, and basic scenes.

#### First and second week
In this time frame I had no big bumps whatsoever because it consisted of pretty basic stuff, generalizing:
- Searched the initial assets for the project
- Created a character and enemies with his sprites and hitboxes
- Put up general variables.
- Started working in the spawner
- Work on the progress bar
- Implemented XP System
#### Second Week

#### Third and fourth week
Here, I started touching more tricky stuff, so some things started to break, but nothing I couldn't fix in a reasonable amount In this week I:
- Started working on Augments
- Added a Pause Menu
- Worked on the fonts for the project
- Implemented Signals into the Workflow
- Modulated some code
Signals can be pretty tricky, especially the ones that include variables within itself, so I had to put some work into it.

### Development Phase (2nd Month)

In this phase, the project was somewhat shaped and directioned, even though I continued to have creative liberties in a big part of the development process.

But being more advanced stuff and more functional than visual, this part was the most difficult of the development process.

#### Fifth and sixth week
I started to add big functionality to the game. This make the development seem stalled at this point, but it just required lots of learning from my part.
- Save Manager Added
- Augment Holder created and handled as Autoload (Singleton)
- Created the AugmentsScreen scene.
#### Sixth and seventh week
These weeks meant beggining to be able to utilize and polish the big parts of the game developed the week before. Next work was also organized.
- Augment selection and sorting rework.
- Added sound effects to the game, and audio buses developed.
- TODOs and priorities distributed.

### Functionality Phase (3rd Month)
With the core of the game itself working, the main thing left to do was to make it fun and visually appealing. Implementation of features became easy since the heavy lifting was done in the last month.
#### Eighth and ninth week
The development here was driven into making it feel like an actual game, with its basic menus and options, and having game mechanics.
- Six main augments developed
- General small bugfixing
- Main menu, credit and options screen designed and created.
- Project files renamed and sorted
#### Tenth and eleventh week
Practically the same as the two weeks before.
- Main visual theme developed
- Boot screen added
- Added a logo and tested a basic Windows build.
- Installed [Dialogic](https://github.com/dialogic-godot/dialogic) to manage the main cutscene.
### Polishing Phase (4th Month)
In this final part of the project, I focused on finishing it in the best way possible. 
#### Twelveth and Thirteenth week
This weeks were dedicated to meet the actual minimum requirements asked for in the revisions of the project.
- Added Mushroom Variants
- Created new enemy from scratch
- Implemented the main cutscene for the first time the game launches.
- Reworked the difficulty to make it as fun as possible.
#### Fourteenth Week
This week, I closed the project and focused on documenting, for example, with this gitbook or the project presentation itself.

## Testing

Being a pretty basic game, testing is not that needed. This is usually for more data-depending programs or bigger apps in general.
Either way I added some just to meet the requirement.
This was done with the help of __gut__, a community-made Unit Testing Tool for Godot. 

## Distribution

### `Itch.io`
Itch.io is the go-to platform to publish indie videogames, since it's completely free to do so, allows for high game page customization and has a low sales cut, between a lot of reasons.
 
This platform is in rising popularity, since fairly popular games like Buckshot Roulette or WindowKill are reaching the general public.
 
Being the page used by the most users without requiring to pay initially, I've decided to post my game in this page for some visibility and possible interactions with other users.

### Export
Godot engine has, like every decent Game Engine, an export function that allows the game to be ported to different platforms like Windows, Android, Web, Linux, Mac... This is as easy as going to the `Project` menu and Export. Here, we can manage how we want the Project to be exported.

## Game Manual

The game presents itself as a learn-as-you-play experience, since it's pretty self-explanatory.

The game starts on a Typical Main Menu with 4 buttons. 

Two are obvious to the user, since those are the one it will want to click on first.

The other two will be found easily if the user is searching for them, so they're not a burden.

At hitting play, if never launched, the game will play the initial cinematic. As seen, this can be advanced using E.

When this ends, the game will launch this time. Enemies will come to the player and they can be eliminated pressing the key they have above their head. When enough enemies are killed, an "Augment Screen" will show up.
The player can read the upgrades hovering the mouse over them, and can pick one with the keys below these upgrades.

This will apply instantly, and the game will go on. The player can be only hit once before dying, since he's a prideful Samurai.

At certain levels, new enemies with special mecanics will come up, and the player must guess how to overcome them.

## Conclussions

### Initial idea comparison
The main idea was greatly covered in the final product, fulfilling the main difficulty which is, well, making the game itself.
The game is totally playable and the gameplay loop objective is completed.
The only objective not felt completed by me on the final project could be some more work on the fluidity aspect of the game.


### Future Upgrades

Being a videogame, practically every aspect could be improved, even more being an artistic discipline. The main ones I can think of are:
1. **Spanish Translation**. Being a native myself, this shouldn't be too hard.
2. **Assets improvement**. Im just starting learning art so it's a WIP.
3. **Bosses**. The initial sensei could be used as a future boss, for example.
4. **More Augments**. Adding more would make the game more random and fun and less repetitive.
5. **Self-Made Music**. The assets got the job done, but some original music could enhance the experience.
6. **Achievements**. This could incentivate players to get all of them and feel some sort of challenges.
7. **Unlocks**. Overall progression is another way of making things fun, and the player could be unlocking cinematics (and a gallery for them) and some backgrounds for the main level. This could be done with a level system so the player feels more rewarded.
8. **Story and endless mode**. Another way of implementing a story could be adding a mode for itself while having another endless mode for the mainly developed mode here.

 ## Credits
 A game by Javier Jimenez-Alfaro Hacha

 Made With Godot Engine

## Assets Used:

### Visual:

[Game Background](https://aethrall.itch.io/demon-woods-parallax-background) 
[Mushroom Enemy](https://luizmelo.itch.io/monsters-creatures-fantasy)  
[Samurai Pixel Art](https://xzany.itch.io/samurai-4-pixel-art)  
[Mago Fonts](https://nimblebeastscollective.itch.io/magosfonts)  
[UI Asset Pack](https://srtoasty.itch.io/ui-assets-pack-2)  
[Smoke VFX](https://pimen.itch.io/smoke-vfx-1)  
[Lucid Icon Pack](https://leo-red.itch.io/lucid-icon-pack)  
[Main menu background](https://free-game-assets.itch.io/free-sky-with-clouds-background-pixel-art-set)
[Scroll Sprite by Mar](https://www.instagram.com/seagull_nest/)
### Sound effects and music:
[Main Theme](https://opengameart.org/content/japanese-samurai-ninja-battle-trailer)
[Whip sound](https://freesound.org/people/morgantj/sounds/60756/)  
[Sword Swing](https://freesound.org/people/32cheeseman32/sounds/180837/)  
[Slash](https://freesound.org/people/wesleyextreme_gamer/sounds/574821/)  
[Wood Dropped](https://freesound.org/people/beautifuldaymonster1968/sounds/706824/)  
[Starting cinematic song](https://freesound.org/people/zagi2/sounds/331734/)  

## Special Thanks to:

The Godot Community, for creating such an amazing tool 🤖

Mar, for her great art and visual counseling 🖌️

Antonio, for his coding help and structured thinking 💻

Dino, for his everyday support 🐸

Javi, for his always available "Linux Wizard" help 🧙‍♂️
