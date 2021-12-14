# nhyodyne: A Modular Backplane Computer (MBC)
# Introduction
The purpose of this project is to revisit the design concepts behind my original Z80 SBC (aka test prototype) which has evolved into the SBC V2-005 over several years. Attempt to introduce some new concepts to make the design more modular, flexible, and less expensive. Use low cost prototype PCBs (100x100mm) available for less than $20 including shipping from JLCPCB. Make simple single function boards to implement good program design concepts from Computer Science: high cohesion and low coupling. Maintain as much backward compatibility with latest SBC V2 as possible.

# Overview
The MBC consists of four core boards: Z80 backplane, Z80 processor, Z80 clock, and Z80 ROM. These are sufficient to build a working system of minimum capability. However  the core boards are designed in such a way that they can be individually redesigned and replaced with improved designs and/or customized to suit the builder. It achieves low coupling by implementing a simple bus using off-the-shelf 2×25 2.54mm spaced pin headers and socket strips. The backplane is a replication of a fully buffered Z80 CPU pin out in the same order. Each board has high cohesion by being limited to a single function consisting of only parts specifically related to to perform its task. This lowers builder cost by eliminating unnecessary parts and improves system reliability by having fewer parts to fail. Likewise, if a component or whole board fails it can be replaced without affecting the remaining boards.

# Tools
Open Source tools and software are used to the maximum extend possible to keep costs down for people building the Z80 MBC.  The target software for Z80 MBC is ROMWBW and is supported in the Dev Branch.  All boards are designed using KiCAD version 5 or later and FreeRouting for PCB trace autorouting.  Gerber files are supplied for most boards and can be obtained from JLCPCB or the PCB manufacturer of your choice.

RomWBW Dev Branch  https://github.com/wwarthen/romwbw/tree/dev

KiCAD version 5 or later  https://www.kicad.org/

FreeRouting  https://github.com/freerouting/freerouting

JLCPCB  https://jlcpcb.com/

# Additional Design Goals
There are several additional design goals for the Z80 MBC.

First, is to ease constraints on the design to allow for some new configurations. Specifically capability to access memory over the bus and configurable memory map holes for external memory.

A second design goal is making all IO devices optional, fully configurable, and limiting IO port addresses to only the minimum necessary. Multiple IO devices can exist in the system simultaneously or not exist as the builder chooses. Lowers cost and improves system reliability by removing unneeded and/or unwanted capabilities.

The third design goal is allowing multiple memory modules with boot enable jumpers to specify boot devices present after CPU reset.

Fourth, adding simple debug features like user LEDs and a switch.

Fifth, implementing a fully buffered Z80 processor with configurable wait state capability and no internal IO or memory devices. Related is each board is also fully buffered to keep bus signals only on the bus with no raw bus signals intruding into the board past the buffers.

Sixth, maintain backwards compatibility to the extent possible (two exceptions so far) to reuse existing SBC software. Target software is current ROMWBW

Seventh, lower build cost by using inexpensive off-the-shelf components and PCBs. All parts come from Jameco or eBay (like bus connectors). Use simple 9vdc 1A unregulated power supply. Keep part count on boards low so they are effectively disposable eliminating the need for sockets and further lowering builder costs. Make non-essential components optionally do-not-populate.

![IMG-1692](https://user-images.githubusercontent.com/86925539/144116345-c4b32c04-1b2d-48f0-a56d-0735849f6f7f.jpg)

Photo: Wayne Warthen's early version of Z80 MBC with prototype DSKY V3.  From left to right; contains boards Z80BCKPLN1 (underneath), Z80CLOCK, Z80PROC, Z80RAM, Z80ROM, Z80SERIAL, and Z80PPIDE with CF adapter installed.  Z80PPIDE is also connected to DSKY V3 via legacy PPI connector.
DSKY V3 by Dan Werner  https://www.retrobrewcomputers.org/doku.php?id=boards:ecb:dskyng

# Frequently Asked Questions
  What is "nhyodyne"?  The name nyhodyne is completely made up in an attempt to be unique.  It is pronounced like "neodyne".  https://www.howtopronounce.com/neo meaning "new" and https://www.howtopronounce.com/dyne meaning "force"

  Who is the intended audience?  Electronic and retrocomputing hobbyists of all ages and experience.  From brand new beginners to experienced designers, all are welcome.  Help is available on the discussion forum as needed or get in contact with me personally.  The boards are designed with beginners in mind and use common off-the-shelf tools and components.  I try to keep specialized parts to a minimum as well as surface mount devices (SMD) and/or programmable logic devices (GALs, CPLDs, FPGAs).  

Can I use these designs in my science fair, school project, etc?  Sure, but please cite your source so others can find this project too.

What if I want to fork my own project based on your work?  It's OK with me and I wish you the best of luck.  I'll be happy to answer questions as best I can and as time allows.

Can these designs be used commercially?  Not really and I'd prefer they be kept for hobbyists because that's they're intended purpose.  If you take these designs partially or in whole commercial you are on your own and accept all associated risk.  These are intended for hobbyist and educational use only.

Why are all the Printed Circuit Boards (PCBs) green?  I like green PCBs and am a bit of a traditionalist from back in the day when PCBs only came in green.  Also it is a good color choice to see the traces underneath and provides good contrast compared to other colors.  That being said, you can make your PCBs any color you like when you order them.

Wow, this is cool!  How do I get involved?  Simple, download the Gerber files and get them built at JLCPCB or whatever PCB manufacturer you prefer.  Order parts and build your boards.  Post your questions on the forum with pictures.

What can I do to support nhyodyne project?  Great question!  What it most needs is YOU so start building your boards right away.  Then tell your friends.  Post on your favorite retrocomputing forums like retro-comp, comp.os.cpm, vogons.org, vintage computer sites, retrobrewcomputers.org, S100computers.com, etc.

Do you accept monetary donations?  Not really, but some people send money and I appreciate their generousity and thank them profusely. However, the truth is I am a senior engineer much closer to retirement than the beginning of my career.  I really enjoy this hobby so much I want to share it with others and make new friends.  If you insist on donations, I will usually graciously accept them but I'd rather you built your own system and tell all your friends about it.

Hey, I've got a great idea for a new board!  How to I make it?  I can help you and depending on your skill level either make it myself for the project or help you make it yourself.   There are people doing both.  I occasionally take requests for new boards although when I make them they are subject to my sense of priority and availability.  In other words, if I make them it will be on my own time and when I am ready.

Any closing thoughts?   Yes, have a great day!  Get out and enjoy your life!  This is a wonderful hobby and I've met the best people -- you will too.  I wish you a long and prosperous life with all the happiness it can bring.  Help someone else along the way.
