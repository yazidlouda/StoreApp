//
//  Item.swift
//  StoreAppProject
//
//  Created by Home on 5/24/21.
//

import Foundation
import UIKit

struct Item {
    let name: String
    let price: Double
    let image: UIImage
    let description: String
}

let clothing:[Item] = [
    Item(name: "Black Elastic Shirt", price: 39.99, image: UIImage(named: "c1")!, description: "High quality stretchy and soft fabric made the fashion jumpsuit works with most body types."),
    Item(name: "Tie Dye Jumpsuit", price: 59.99, image: UIImage(named: "c2")!, description: "This jumpsuit features sleeveless tank top/ short sleeves top, bust pocket, scoop neckline, elastic smocked waist waistband, drawstring tie, two pockets, beam foot long pants."),
    Item(name: "Blue Polo", price: 99.99, image: UIImage(named: "c3")!, description: "From the course to casual wear, this classic performance polo keeps you cool and comfortable in quick-dry fabric that wicks away moisture."),
    Item(name: "Gray Pants", price: 29.99, image: UIImage(named: "c4")!, description: "This slim-fit chino pant features wrinkle-free fabric, a flat-front design, and button-through back welt pockets for a tailored look and all-day comfort."),
    Item(name: "Yellow Dress", price: 49.99, image: UIImage(named: "c5")!, description: "This versatile and figure-flattering dress transitions easily from day to night."),
    Item(name: "Zip-Up Jacket", price: 69.99, image: UIImage(named: "c6")!, description: "This everyday-classic sweatshirt is a go-to for an easy, casual look."),
    Item(name: "Cargo Shorts", price: 79.99, image: UIImage(named: "c7")!, description: "Sits at waist, zip fly and button closure, drawstring tie at waist and belt loops."),
    Item(name: "Star Wars T-Shirt", price: 39.99, image: UIImage(named: "c8")!, description: "Find your Disney style! Amazon Essentials and Disney pair up to add some wonder to your wardrobe with fresh prints and patterns for your family featuring your favorite characters from Mickey, Marvel to Star Wars and more."),
    Item(name: "Moreno Oxford Shoe", price: 149.99, image: UIImage(named: "c9")!, description: "Men's Moreno Canvas Oxford Shoe."),
    Item(name: "Sun Hat", price: 49.99, image: UIImage(named: "c10")!, description: "With wide brim flap cover on this cap, adding stylish&cool style, leading to the fashion top trend. Lightweight, comfort&protective sun cap hat for use in summer, autumn, and spring."),
]

let kitchen:[Item] = [
    Item(name: "Black Hawk Knives", price: 39.99, image: UIImage(named: "k1")!, description: "The Black Hawk 5 inch Steak Knife is designed for cutting steak, there are four knives to allow you and your family to enjoy a delicious meal together. The serrated edge provide the stunning cutting ability, so that you can cut through the tender steak with minimal effort."),
    Item(name: "Dish Drain Rack", price: 59.99, image: UIImage(named: "k2")!, description: "Perfect for your compact countertop! This over sink dish drainer rack saves tons of kitchen space and does not obstruct anything with the faucet or sink. When you dry the dishes and utensils, water will drip directly to the sink, keeping your countertop dry, clean, and tidy."),
    Item(name: "Veggie Storage", price: 99.99, image: UIImage(named: "k3")!, description: "Double Baskets, Provide Generous Storage Space, It Can Store Lots Of Fruits, Veggies, Or Other Items, Wire Design Make You Easily To Find And Select The Items You Needed."),
    Item(name: "SESENO Food Container", price: 29.99, image: UIImage(named: "k4")!, description: "Keep your food dry and safe with The SESENO Plastic Food Storage Containers."),
    Item(name: "Ember Smart Mug", price: 49.99, image: UIImage(named: "k5")!, description: "Ember smart mug allows you to control with your smartphone. Pair with the Ember app to set your temperature, customize presets, receive notifications and more."),
    Item(name: "Wooden Utensils", price: 69.99, image: UIImage(named: "k6")!, description: "Our wooden kitchen utensil set includes a wooden spatula, a slotted spoon, a small wooden spoon, and a bamboo mat. Made of 100% natural teak wood."),
    Item(name: "Nifty Coffee Pod Storage", price: 79.99, image: UIImage(named: "k7")!, description: "The Nifty Coffee Pod Storage Drawer is compatible with K-Cups and will hold up to 36 of your favorite pods where space is a necessity."),
    Item(name: "Lazy Susan", price: 39.99, image: UIImage(named: "k8")!, description: "Built-in turntables keep all your spices at your fingertips with a simple spin. Makes everything visible and provides storage for taller items."),
    Item(name: "Copper Mixer", price: 149.99, image: UIImage(named: "k9")!, description: "Featured with 800W Pure Copper High Performance Motor and aluminum housing, the mixer can definitely better handle heavier mixes like pastry and pizza dough than plastic mixers, while whipping egg whites and mashed potatoes, mixing cake batters and making frosting is also a breeze with this powerful electric mixer."),
    Item(name: "HyperGrind Coffee Grinder", price: 49.99, image: UIImage(named: "k10")!, description: "Unlike many others on the market, the Mueller HyperGrind gives you perfect consistency & precision control over the coarseness of your Pour Over, Drip, Chemex, Cold Brew, French Press, Percolator,Turkish, Espresso, Herb, or Spices grind EVERY TIME!"),
]
let outdoor:[Item] = [
Item(name: "Outdoor Rug", price: 39.99, image: UIImage(named: "od1")!, description: "Timeless design, this plastic patio rug is elegant as it is functional, use on your patio with outdoor furniture and accessories to show off your personal style."),
Item(name: "G40 String Lights", price: 59.99, image: UIImage(named: "od2")!, description: "The G40 string lights are dimmable(Remote is NOT included.) and UL listed,2 spare bulbs for replacement.All the remaining bulbs will continue lighting up and brightening up our life even if some bulbs broken or removed."),
Item(name: "Outdoor Hammock", price: 99.99, image: UIImage(named: "od3")!, description: "Unlike Other Hammocks ours are made of high quality heavy duty 210T parachute nylon. This extra soft yet super strong material gives you the most comfortable and relaxing experience ever."),
Item(name: "Curtain Panel", price: 29.99, image: UIImage(named: "od4")!, description: "Sheer Curtain Panels in Each Package: Your package will include 2 indoor/outdoor white sheer curtains. Each panel measures 52 inch wide by 84 inch long for a total width of 104 inches and features 8 rustproof metal grommets with 1.6-inch inner diameter. Fit well with standard or decorative curtain rods, super easy to hang."),
Item(name: "Solar Lights", price: 49.99, image: UIImage(named: "od5")!, description: "Solar Panel collects sunlight to charge the batteries(included) during the day. Automatically turns on at dusk for up to 6 hours of nighttime illumination."),
Item(name: "Storage Deck Box", price: 69.99, image: UIImage(named: "od6")!, description: "Keter Solana 70 Gallon Storage Bench Deck Box for Patio Furniture, Front Porch Deco."),
Item(name: "Revel", price: 79.99, image: UIImage(named: "od7")!, description: "Designed with 2 chamber benefits Batch composting, which is the most efficient way to produce high-quality compost; Let one side cook while you add fresh materials to the other, continuously swapping sides creates an uninterrupted flow of rich, healthy compost."),
Item(name: "polyTEAK Umbrella", price: 39.99, image: UIImage(named: "od8")!, description: "100% POLYESTER FABRIC -- PolyTEAK patio umbrella is made of 100% polyester, waterproof and UV resistant, long lasting, easy to clean."),
Item(name: "Plant Pots", price: 149.99, image: UIImage(named: "od9")!, description: "Thick, high-quality PP materials can be used repeatedly without fading, not easy to crack even in summer."),
Item(name: "Oversized Chair", price: 49.99, image: UIImage(named: "od10")!, description: "The weatherproof chair has 22 inch oversized seat width, comfortably contoured seating with a weight capacity of 350 lbs, ergonomic backrest and wide armrests, which offer the comfort expected of Adirondack chairs. And the oversized design offers the freedom for any sitting and lying position.")
]

var toys:[Item] = [
    Item(name: "Spawn Action Figure", price: 39.99, image: UIImage(named: "toy1")!, description: "Incredibly detailed 7” scale figure based off the Mortal Kombat Franchise."),
    Item(name: "GT3 replica", price: 59.99, image: UIImage(named: "toy2")!, description: "An immersive and rewarding building experience with this highly authentic Nifeliz super car GT3 replica, Packed with realistic features and functions."),
    Item(name: "LEGO Darth Vader Helmet", price: 99.99, image: UIImage(named: "toy3")!, description: "Escape the stresses of everyday life for a while and enjoy some quality time recreating every menacing detail of Darth Vader’s Helmet with this collectible LEGO Star Wars building kit."),
    Item(name: "D&D Dragon Figure", price: 29.99, image: UIImage(named: "toy4")!, description: "The D&D Icons of the Realms: Adult Blue Dragon Premium Figure is an excellent addition to your miniatures collection or display shelf."),
    Item(name: "Buzz Lightyear Figure", price: 49.99, image: UIImage(named: "toy5")!, description: "Press chest button for wing release and wing lights; Wing tips, wing housing, and wrist light up activate flashing laser lights."),
    Item(name: "Camera Toy", price: 69.99, image: UIImage(named: "toy6")!, description: "2.4 inch IPS Screen Shockproof Mini kids Video Camera with dual lens,support selfie. Rear Lens features a Wide-Angle design, larger viewing and more realistic colors for a better picture. 4x digital zoom, 30 Megapixels and 1080p HD video recording. Support Auto-focus, Time-lapse shooting, 5 Burst shooting."),
    Item(name: "RC Offroad Car", price: 79.99, image: UIImage(named: "toy7")!, description: "Featuring a superior 750 mAh lithium battery, ultra-powerful motor, 2 high-strength metal universal joints, 4 resilient carbon fiber axels, 4 advanced shock absorber springs, and high grip herringbone tires."),
    Item(name: "Barbie Dreamhouse", price: 39.99, image: UIImage(named: "toy8")!, description: "Measuring 43 inches tall and 41 inches wide, the fully furnished Barbie DreamHouse inspires endless imagination with 10 indoor and outdoor play areas, customizable features and 75+ storytelling pieces!"),
    Item(name: "Nerf Rival Blaster", price: 149.99, image: UIImage(named: "toy9")!, description: "The Nerf Rival Phantom Corps is a group of rogue specialists who may join Team Red or Team Blue today, then challenge those teams tomorrow. Nerf Rival battles will never be the same! Experience intense head-to-head competition with the precision and power of the Nerf Rival Hera MXVII-1200 blaster."),
    Item(name: "Nazgul Statue", price: 49.99, image: UIImage(named: "toy10")!, description: "A Diamond Select Toys release! Form the Fellowship! Add the Hobbit that started it all to your 7-inch Lord of the Rings collection with this highly anticipated release! Featuring movie likeness, this approximately 4-inch figure shares the series with a 7-inch Nazgul/Ringwraith!"),
]
let homeGood:[Item] = [
    Item(name: "iRobot 600", price: 39.99, image: UIImage(named: "h1")!, description: "The 600 series is a great way to begin cleaning your home smarter. Just schedule it to clean up daily dirt, dust, and debris with the iRobot HOME app or your voice assistant. - for effortlessly clean floors."),
    Item(name: "Yankee Candle", price: 59.99, image: UIImage(named: "h2")!, description: "A heartwarming blend of cinnamon, baking spices, and a hint of freshly poured tea."),
    Item(name: "Air Purifier", price: 99.99, image: UIImage(named: "h3")!, description: "New generation HEPA air purifiers for smokers, allergies, mold, pet owners, parents with newborns."),
    Item(name: "Broom and Dust Pan", price: 29.99, image: UIImage(named: "h4")!, description: "Broom and dust pan Snaps together for easy stand-up storage, save your space and easy for moving."),
    Item(name: "AccuCheck Scale", price: 49.99, image: UIImage(named: "h5")!, description: "The AccuCheck verifies its initial reading after you step off. Never question the process: an orange light means you’ve been weighed and green means it’s verified."),
    Item(name: "Hanging Sign", price: 69.99, image: UIImage(named: "h6")!, description: "Today is A Good Day to Have A Good Day - Sometimes, all we need is the right attitude. We have 24 hours in a day, and we can do so much with it! Let’s start with today."),
    Item(name: "Towel Set", price: 79.99, image: UIImage(named: "h7")!, description: "Perfect Towel Set - Set includes 4 piece bath towel 30 x 54. Enjoy this bath towel in a whopping over-size."),
    Item(name: "MyPillow Pillow", price: 39.99, image: UIImage(named: "h8")!, description: "Made with patented interlocking fill, gives you the exact support you need as an individual."),
    Item(name: "20V Tool Set", price: 149.99, image: UIImage(named: "h9")!, description: "Includes 20V Lithium drill for a variety of home projects, hanging pictures or wall decor, assembling furniture, updating fixtures, building birdhouses."),
    Item(name: "Comforter Set", price: 49.99, image: UIImage(named: "h10")!, description: "Super Soft Microfiber All Season Blanket Comforter , Lightweight but warm material, perfect summer comforter or extra blanket during the winter. Specially processed fabrics are more comfortable and breathable, and friendly to human skin.")
]
