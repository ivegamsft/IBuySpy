﻿/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

-- ===============================================
-- CONFIG ASP.NET Commerce STARTER KIT DATABASE
-- Load Sample Data Script
-- 
-- Version:	1.2 - 01/02 (swarren)
--
-- ===============================================

-- =======================================================
-- INSERT INITIAL DATA INTO IBUYSPY Commerce DB
-- =======================================================

SET DATEFORMAT mdy
GO

DELETE FROM [CMRC_Categories]

GO

SET IDENTITY_INSERT [CMRC_Categories] ON

GO

INSERT INTO [CMRC_Categories]
([CategoryID],[CategoryName])
SELECT 14, 'Communications'
UNION ALL
SELECT 15, 'Deception'
UNION ALL
SELECT 16, 'Travel'
UNION ALL
SELECT 17, 'Protection'
UNION ALL
SELECT 18, 'Munitions'
UNION ALL
SELECT 19, 'Tools'
UNION ALL
SELECT 20, 'General'


GO

SET IDENTITY_INSERT [CMRC_Categories] OFF

GO

-- Vertigo Software Data Script File
-- This file was auto-generated by Utilities.DataScripter Version 1.0.1152.18116 on 2/26/2003 at 1:02 PM.

DELETE FROM [CMRC_Customers]

GO

SET IDENTITY_INSERT [CMRC_Customers] ON

GO

INSERT INTO [CMRC_Customers]
([CustomerID],[FullName],[EmailAddress],[Password])
SELECT 1, 'Big Guy', 'bg@aj.net', '123'
UNION ALL
SELECT 2, 'Sarah Goodpenny', 'sg@ibuyspy.com', '15-72-5B-0E-E7-A6-5E-A3-4A-BF-84-C8-58-93-18-FA'
UNION ALL
SELECT 3, 'Gordon Que', 'gq@ibuyspy.com', '15-72-5B-0E-E7-A6-5E-A3-4A-BF-84-C8-58-93-18-FA'
UNION ALL
SELECT 20, 'hash test', 'hash@hash.com', '5F-A2-85-E1-BE-BE-0A-66-23-E3-3A-FC-04-A1-FB-D5'
UNION ALL
SELECT 19, 'Guest Account', 'guest', 'D0-09-1A-0F-E2-B2-09-34-D8-8B-46-06-84-F5-97-89'
UNION ALL
SELECT 16, 'Test Account', 'd', '2B-9D-4F-A8-5C-8E-82-13-2B-DE-46-B1-43-04-01-42'

GO

SET IDENTITY_INSERT [CMRC_Customers] OFF

GO

-- Vertigo Software Data Script File
-- This file was auto-generated by Utilities.DataScripter Version 1.0.1152.18116 on 2/26/2003 at 1:02 PM.

DELETE FROM [CMRC_Orders]

GO

SET IDENTITY_INSERT [CMRC_Orders] ON

GO

INSERT INTO [CMRC_Orders]
([OrderID],[CustomerID],[OrderDate],[ShipDate])
SELECT 99, 19, '7/6/2000 1:01:00 AM', '7/7/2000 1:01:00 AM'
UNION ALL
SELECT 93, 16, '7/3/2000 1:01:00 AM', '7/4/2000 1:01:00 AM'
UNION ALL
SELECT 101, 16, '7/10/2000 1:01:00 AM', '7/11/2000 1:01:00 AM'
UNION ALL
SELECT 103, 16, '7/10/2000 1:01:00 AM', '7/10/2000 1:01:00 AM'
UNION ALL
SELECT 96, 19, '7/3/2000 1:01:00 AM', '7/3/2000 1:01:00 AM'
UNION ALL
SELECT 104, 19, '7/10/2000 1:01:00 AM', '7/11/2000 1:01:00 AM'
UNION ALL
SELECT 105, 16, '10/30/2000 1:01:00 AM', '10/31/2000 1:01:00 AM'
UNION ALL
SELECT 106, 16, '10/30/2000 1:01:00 AM', '10/30/2000 1:01:00 AM'
UNION ALL
SELECT 107, 16, '10/30/2000 1:01:00 AM', '10/31/2000 1:01:00 AM'
UNION ALL
SELECT 100, 19, '7/6/2000 1:01:00 AM', '7/8/2000 1:01:00 AM'
UNION ALL
SELECT 102, 16, '7/10/2000 1:01:00 AM', '7/12/2000 1:01:00 AM'
UNION ALL
SELECT 108, 1, '2/24/2003 11:32:07 AM', '2/24/2003 11:32:07 AM'

GO

SET IDENTITY_INSERT [CMRC_Orders] OFF

GO

-- Vertigo Software Data Script File
-- This file was auto-generated by Utilities.DataScripter Version 1.0.1152.18116 on 2/26/2003 at 1:02 PM.

DELETE FROM [CMRC_OrderDetails]

GO

INSERT INTO [CMRC_OrderDetails]
([OrderID],[ProductID],[Quantity],[UnitCost])
SELECT 99, 404, 2, 459.99
UNION ALL
SELECT 93, 363, 1, 1.99
UNION ALL
SELECT 101, 378, 2, 14.99
UNION ALL
SELECT 102, 372, 1, 129.99
UNION ALL
SELECT 96, 378, 1, 14.99
UNION ALL
SELECT 103, 363, 1, 1.99
UNION ALL
SELECT 104, 355, 1, 1499.99
UNION ALL
SELECT 104, 378, 1, 14.99
UNION ALL
SELECT 104, 406, 1, 399.99
UNION ALL
SELECT 100, 404, 2, 459.99
UNION ALL
SELECT 101, 401, 1, 599.99
UNION ALL
SELECT 102, 401, 1, 599.99
UNION ALL
SELECT 104, 362, 1, 1.99
UNION ALL
SELECT 104, 404, 1, 459.99
UNION ALL
SELECT 105, 355, 2, 1499.99
UNION ALL
SELECT 106, 401, 1, 599.99
UNION ALL
SELECT 106, 404, 2, 459.99
UNION ALL
SELECT 107, 368, 2, 19999.98
UNION ALL
SELECT 108, 378, 1, 14.99

GO



-- Vertigo Software Data Script File
-- This file was auto-generated by Utilities.DataScripter Version 1.0.1152.18116 on 2/26/2003 at 1:02 PM.

DELETE FROM [CMRC_Products]

GO

SET IDENTITY_INSERT [CMRC_Products] ON

GO

INSERT INTO [CMRC_Products]
([ProductID],[CategoryID],[ModelNumber],[ModelName],[ProductImage],[UnitCost],[Description])
SELECT 355, 16, 'RU007', 'Rain Racer 2000', 'image.gif', 1499.99, 'Looks like an ordinary bumbershoot, but don''t be fooled! Simply place Rain Racer''s tip on the ground and press the release latch. Within seconds, this ordinary rain umbrella converts into a two-wheeled gas-powered mini-scooter. Goes from 0 to 60 in 7.5 seconds - even in a driving rain! Comes in black, blue, and candy-apple red.'
UNION ALL
SELECT 356, 20, 'STKY1', 'Edible Tape', 'image.gif', 3.99, 'The latest in personal survival gear, the STKY1 looks like a roll of ordinary office tape, but can save your life in an emergency.  Just remove the tape roll and place in a kettle of boiling water with mixed vegetables and a ham shank. In just 90 minutes you have a great tasking soup that really sticks to your ribs! Herbs and spices not included.'
UNION ALL
SELECT 357, 16, 'P38', 'Escape Vehicle (Air)', 'image.gif', 2.99, 'In a jam, need a quick escape? Just whip out a sheet of our patented P38 paper and, with a few quick folds, it converts into a lighter-than-air escape vehicle! Especially effective on windy days - no fuel required. Comes in several sizes including letter, legal, A10, and B52.'
UNION ALL
SELECT 358, 19, 'NOZ119', 'Extracting Tool', 'image.gif', 199, 'High-tech miniaturized extracting tool. Excellent for extricating foreign objects from your person. Good for picking up really tiny stuff, too! Cleverly disguised as a pair of tweezers. '
UNION ALL
SELECT 359, 16, 'PT109', 'Escape Vehicle (Water)', 'image.gif', 1299.99, 'Camouflaged as stylish wing tips, these ''shoes'' get you out of a jam on the high seas instantly. Exposed to water, the pair transforms into speedy miniature inflatable rafts. Complete with 76 HP outboard motor, these hip heels will whisk you to safety even in the roughest of seas. Warning: Not recommended for beachwear.'
UNION ALL
SELECT 360, 14, 'RED1', 'Communications Device', 'image.gif', 49.99, 'Subversively stay in touch with this miniaturized wireless communications device. Speak into the pointy end and listen with the other end! Voice-activated dialing makes calling for backup a breeze. Excellent for undercover work at schools, rest homes, and most corporate headquarters. Comes in assorted colors.'
UNION ALL
SELECT 362, 14, 'LK4TLNT', 'Persuasive Pencil', 'image.gif', 1.99, 'Persuade anyone to see your point of view!  Captivate your friends and enemies alike!  Draw the crime-scene or map out the chain of events.  All you need is several years of training or copious amounts of natural talent. You''re halfway there with the Persuasive Pencil. Purchase this item with the Retro Pocket Protector Rocket Pack for optimum disguise.'
UNION ALL
SELECT 363, 18, 'NTMBS1', 'Multi-Purpose Rubber Band', 'image.gif', 1.99, 'One of our most popular items!  A band of rubber that stretches  20 times the original size. Uses include silent one-to-one communication across a crowded room, holding together a pack of Persuasive Pencils, and powering lightweight aircraft. Beware, stretching past 20 feet results in a painful snap and a rubber strip.'
UNION ALL
SELECT 364, 19, 'NE1RPR', 'Universal Repair System', 'image.gif', 4.99, 'Few people appreciate the awesome repair possibilities contained in a single roll of duct tape. In fact, some houses in the Midwest are made entirely out of the miracle material contained in every roll! Can be safely used to repair cars, computers, people, dams, and a host of other items.'
UNION ALL
SELECT 365, 19, 'BRTLGT1', 'Effective Flashlight', 'image.gif', 9.99, 'The most powerful darkness-removal device offered to creatures of this world.  Rather than amplifying existing/secondary light, this handy product actually REMOVES darkness allowing you to see with your own eyes.  Must-have for nighttime operations. An affordable alternative to the Night Vision Goggles.'
UNION ALL
SELECT 367, 18, 'INCPPRCLP', 'The Incredible Versatile Paperclip', 'image.gif', 1.49, 'This 0. 01 oz piece of metal is the most versatile item in any respectable spy''s toolbox and will come in handy in all sorts of situations. Serves as a wily lock pick, aerodynamic projectile (used in conjunction with Multi-Purpose Rubber Band), or escape-proof finger cuffs.  Best of all, small size and pliability means it fits anywhere undetected.  Order several today!'
UNION ALL
SELECT 368, 16, 'DNTRPR', 'Toaster Boat', 'image.gif', 19999.98, 'Turn breakfast into a high-speed chase! In addition to toasting bagels and breakfast pastries, this inconspicuous toaster turns into a speedboat at the touch of a button. Boasting top speeds of 60 knots and an ultra-quiet motor, this valuable item will get you where you need to be ... fast! Best of all, Toaster Boat is easily repaired using a Versatile Paperclip or a standard butter knife. Manufacturer''s Warning: Do not submerge electrical items.'
UNION ALL
SELECT 370, 17, 'TGFDA', 'Multi-Purpose Towelette', 'image.gif', 12.99, 'Don''t leave home without your monogrammed towelette! Made from lightweight, quick-dry fabric, this piece of equipment has more uses in a spy''s day than a Swiss Army knife. The perfect all-around tool while undercover in the locker room: serves as towel, shield, disguise, sled, defensive weapon, whip and emergency food source. Handy bail gear for the Toaster Boat. Monogram included with purchase price.'
UNION ALL
SELECT 371, 18, 'WOWPEN', 'Mighty Mighty Pen', 'image.gif', 129.99, 'Some spies claim this item is more powerful than a sword. After examining the titanium frame, built-in blowtorch, and Nerf dart-launcher, we tend to agree! '
UNION ALL
SELECT 372, 20, 'ICNCU', 'Perfect-Vision Glasses', 'image.gif', 129.99, 'Avoid painful and potentially devastating laser eye surgery and contact lenses. Cheaper and more effective than a visit to the optometrist, these Perfect-Vision Glasses simply slide over nose and eyes and hook on ears. Suddenly you have 20/20 vision! Glasses also function as HUD (Heads Up Display) for most European sports cars manufactured after 1992.'
UNION ALL
SELECT 373, 17, 'LKARCKT', 'Pocket Protector Rocket Pack', 'image.gif', 1.99, 'Any debonair spy knows that this accoutrement is coming back in style. Flawlessly protects the pockets of your short-sleeved oxford from unsightly ink and pencil marks. But there''s more! Strap it on your back and it doubles as a rocket pack. Provides enough turbo-thrust for a 250-pound spy or a passel of small children. Maximum travel radius: 3000 miles.'
UNION ALL
SELECT 374, 15, 'DNTGCGHT', 'Counterfeit Creation Wallet', 'image.gif', 999.99, 'Don''t be caught penniless in Prague without this hot item! Instantly creates replicas of most common currencies! Simply place rocks and water in the wallet, close, open up again, and remove your legal tender!'
UNION ALL
SELECT 375, 16, 'WRLD00', 'Global Navigational System', 'image.gif', 29.99, 'No spy should be without one of these premium devices. Determine your exact location with a quick flick of the finger. Calculate destination points by spinning, closing your eyes, and stopping it with your index finger.'
UNION ALL
SELECT 376, 15, 'CITSME9', 'Cloaking Device', 'image.gif', 9999.99, 'Worried about detection on your covert mission? Confuse mission-threatening forces with this cloaking device. Powerful new features include string-activated pre-programmed phrases such as "Danger! Danger!", "Reach for the sky!", and other anti-enemy expressions. Hyper-reactive karate chop action deters even the most persistent villain.'
UNION ALL
SELECT 377, 15, 'BME007', 'Identity Confusion Device', 'image.gif', 6.99, 'Never leave on an undercover mission without our Identity Confusion Device! If a threatening person approaches, deploy the device and point toward the oncoming individual. The subject will fail to recognize you and let you pass unnoticed. Also works well on dogs.'
UNION ALL
SELECT 379, 17, 'SHADE01', 'Ultra Violet Attack Defender', 'image.gif', 89.99, 'Be safe and suave. A spy wearing this trendy article of clothing is safe from ultraviolet ray-gun attacks. Worn correctly, the Defender deflects rays from ultraviolet weapons back to the instigator. As a bonus, also offers protection against harmful solar ultraviolet rays, equivalent to SPF 50.'
UNION ALL
SELECT 378, 17, 'SQUKY1', 'Guard Dog Pacifier', 'image.gif', 14.99, 'Pesky guard dogs become a spy''s best friend with the Guard Dog Pacifier. Even the most ferocious dogs suddenly act like cuddly kittens when they see this prop.  Simply hold the device in front of any threatening dogs, shaking it mildly.  For tougher canines, a quick squeeze emits an irresistible squeak that never fails to  place the dog under your control.'
UNION ALL
SELECT 382, 20, 'CHEW99', 'Survival Bar', 'image.gif', 6.99, 'Survive for up to four days in confinement with this handy item. Disguised as a common eraser, it''s really a high-calorie food bar. Stranded in hostile territory without hope of nourishment? Simply break off a small piece of the eraser and chew vigorously for at least twenty minutes. Developed by the same folks who created freeze-dried ice cream, powdered drink mix, and glow-in-the-dark shoelaces.'
UNION ALL
SELECT 402, 20, 'C00LCMB1', 'Telescoping Comb', 'image.gif', 399.99, 'Use the Telescoping Comb to track down anyone, anywhere! Deceptively simple, this is no normal comb. Flip the hidden switch and two telescoping lenses project forward creating a surprisingly powerful set of binoculars (50X). Night-vision add-on is available for midnight hour operations.'
UNION ALL
SELECT 384, 19, 'FF007', 'Eavesdrop Detector', 'image.gif', 99.99, 'Worried that counteragents have placed listening devices in your home or office? No problem! Use our bug-sweeping wiener to check your surroundings for unwanted surveillance devices. Just wave the frankfurter around the room ... when bugs are detected, this "foot-long" beeps! Comes complete with bun, relish, mustard, and headphones for privacy.'
UNION ALL
SELECT 385, 16, 'LNGWADN', 'Escape Cord', 'image.gif', 13.99, 'Any agent assigned to mountain terrain should carry this ordinary-looking extension cord ... except that it''s really a rappelling rope! Pull quickly on each end to convert the electrical cord into a rope capable of safely supporting up to two agents. Comes in various sizes including Mt McKinley, Everest, and Kilimanjaro. WARNING: To prevent serious injury, be sure to disconnect from wall socket before use.'
UNION ALL
SELECT 386, 17, '1MOR4ME', 'Cocktail Party Pal', 'image.gif', 69.99, 'Do your assignments have you flitting from one high society party to the next? Worried about keeping your wits about you as you mingle witih the champagne-and-caviar crowd? No matter how many drinks you''re offered, you can safely operate even the most complicated heavy machinery as long as you use our model 1MOR4ME alcohol-neutralizing coaster. Simply place the beverage glass on the patented circle to eliminate any trace of alcohol in the drink.'
UNION ALL
SELECT 387, 20, 'SQRTME1', 'Remote Foliage Feeder', 'image.gif', 9.99, 'Even spies need to care for their office plants.  With this handy remote watering device, you can water your flowers as a spy should, from the comfort of your chair.  Water your plants from up to 50 feet away.  Comes with an optional aiming system that can be mounted to the top for improved accuracy.'
UNION ALL
SELECT 388, 20, 'ICUCLRLY00', 'Contact Lenses', 'image.GIF', 59.99, 'Traditional binoculars and night goggles can be bulky, especially for assignments in confined areas. The problem is solved with these patent-pending contact lenses, which give excellent visibility up to 100 miles. New feature: now with a night vision feature that permits you to see in complete darkness! Contacts now come in a variety of fashionable colors for coordinating with your favorite ensembles.'
UNION ALL
SELECT 389, 20, 'OPNURMIND', 'Telekinesis Spoon', 'image.gif', 2.99, 'Learn to move things with your mind! Broaden your mental powers using this training device to hone telekinesis skills. Simply look at the device, concentrate, and repeat "There is no spoon" over and over.'
UNION ALL
SELECT 390, 19, 'ULOST007', 'Rubber Stamp Beacon', 'image.gif', 129.99, 'With the Rubber Stamp Beacon, you''ll never get lost on your missions again. As you proceed through complicated terrain, stamp a stationary object with this device. Once an object has been stamped, the stamp''s patented ink will emit a signal that can be detected up to 153.2 miles away by the receiver embedded in the device''s case. WARNING: Do not expose ink to water.'
UNION ALL
SELECT 391, 17, 'BSUR2DUC', 'Bullet Proof Facial Tissue', 'image.gif', 79.99, 'Being a spy can be dangerous work. Our patented Bulletproof Facial Tissue gives a spy confidence that any bullets in the vicinity risk-free. Unlike traditional bulletproof devices, these lightweight tissues have amazingly high tensile strength. To protect the upper body, simply place a tissue in your shirt pocket. To protect the lower body, place a tissue in your pants pocket. If you do not have any pockets, be sure to check out our Bulletproof Tape. 100 tissues per box. WARNING: Bullet must not be moving for device to successfully stop penetration.'
UNION ALL
SELECT 393, 20, 'NOBOOBOO4U', 'Speed Bandages', 'image.GIF', 3.99, 'Even spies make mistakes.  Barbed wire and guard dogs pose a threat of injury for the active spy.  Use our special bandages on cuts and bruises to rapidly heal the injury.  Depending on the severity of the wound, the bandages can take between 10 to 30 minutes to completely heal the injury.'
UNION ALL
SELECT 394, 15, 'BHONST93', 'Correction Fluid', 'image.gif', 1.99, 'Disguised as typewriter correction fluid, this scientific truth serum forces subjects to correct anything not perfectly true. Simply place a drop of the special correction fluid on the tip of the subject''s nose. Within seconds, the suspect will automatically correct every lie. Effects from Correction Fluid last approximately 30 minutes per drop. WARNING: Discontinue use if skin appears irritated.'
UNION ALL
SELECT 396, 19, 'BPRECISE00', 'Dilemma Resolution Device', 'image.gif', 11.99, 'Facing a brick wall? Stopped short at a long, sheer cliff wall?  Carry our handy lightweight calculator for just these emergencies. Quickly enter in your dilemma and the calculator spews out the best solutions to the problem.   Manufacturer Warning: Use at own risk. Suggestions may lead to adverse outcomes.'
UNION ALL
SELECT 397, 14, 'LSRPTR1', 'Nonexplosive Cigar', 'image.gif', 29.99, 'Contrary to popular spy lore, not all cigars owned by spies explode! Best used during mission briefings, our Nonexplosive Cigar is really a cleverly-disguised, top-of-the-line, precision laser pointer. Make your next presentation a hit.'
UNION ALL
SELECT 399, 20, 'QLT2112', 'Document Transportation System', 'image.gif', 299.99, 'Keep your stolen Top Secret documents in a place they''ll never think to look!  This patent leather briefcase has multiple pockets to keep documents organized.  Top quality craftsmanship to last a lifetime.'
UNION ALL
SELECT 400, 15, 'THNKDKE1', 'Hologram Cufflinks', 'image.gif', 799.99, 'Just point, and a turn of the wrist will project a hologram of you up to 100 yards away. Sneaking past guards will be child''s play when you''ve sent them on a wild goose chase. Note: Hologram adds ten pounds to your appearance.'
UNION ALL
SELECT 401, 14, 'TCKLR1', 'Fake Moustache Translator', 'image.gif', 599.99, 'Fake Moustache Translator attaches between nose and mouth to double as a language translator and identity concealer. Sophisticated electronics translate your voice into the desired language. Wriggle your nose to toggle between Spanish, English, French, and Arabic. Excellent on diplomatic missions.'
UNION ALL
SELECT 404, 14, 'JWLTRANS6', 'Interpreter Earrings', 'image.gif', 459.99, 'The simple elegance of our stylish monosex earrings accents any wardrobe, but their clean lines mask the sophisticated technology within. Twist the lower half to engage a translator function that intercepts spoken words in any language and converts them to the wearer''s native tongue. Warning: do not use in conjunction with our Fake Moustache Translator product, as the resulting feedback loop makes any language sound like Pig Latin.'
UNION ALL
SELECT 406, 19, 'GRTWTCH9', 'Multi-Purpose Watch', 'image.gif', 399.99, 'In the tradition of famous spy movies, the Multi Purpose Watch comes with every convenience! Installed with lighter, TV, camera, schedule-organizing software, MP3 player, water purifier, spotlight, and tire pump. Special feature: Displays current date and time. Kitchen sink add-on will be available in the fall of 2001.'

GO

SET IDENTITY_INSERT [CMRC_Products] OFF

GO

-- Vertigo Software Data Script File
-- This file was auto-generated by Utilities.DataScripter Version 1.0.1152.18116 on 2/26/2003 at 1:02 PM.

DELETE FROM [CMRC_Reviews]

GO

SET IDENTITY_INSERT [CMRC_Reviews] ON

GO

INSERT INTO [CMRC_Reviews]
([ReviewID],[ProductID],[CustomerName],[CustomerEmail],[Rating],[Comments])
SELECT 21, 404, 'Sarah Goodpenny', 'sg@ibuyspy.com', 5, 'Really smashing! &nbsp;Don''t know how I''d get by without them!'
UNION ALL
SELECT 22, 378, 'James Bondwell', 'jb@ibuyspy.com', 3, 'Well made, but only moderately effective. &nbsp;Ouch!'

GO

SET IDENTITY_INSERT [CMRC_Reviews] OFF

GO

--Update the product image gifs
UPDATE [dbo].[CMRC_Products]
SET ProductImage = CONCAT (ModelNumber, '.gif')
 GO
--
-- End load data
-- 
