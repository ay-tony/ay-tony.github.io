#import "../templates/post.typ": *

#show: post.with(
  title: "我的世界 GTNH 矿物处理",
  pub_date: (2025, 8, 5),
  upd_date: (2025, 8, 5),
  pub_time: (10, 36, 7),
  tags: ("我的世界", "GTNH"),
  description: "",
)

/ 2025-08-05: 更正了脚本中深渊铁（`DeepIron`）的处理，原来是粉洗粉离，现在更正为粉粉离。

= 概述

我们的存档目前到达了 ZPM 阶段，总结一下使用过的矿物处理方法。到现在矿物处理大致可以分成三个阶段，分别以 GT 类型过滤器、OC 以及 AE 作为矿物分类的核心。使用的矿物处理流水线的基本结构是一样的。

= 基本结构

主要原理是使用各种方法将矿物和中间产物分类，并分别输送到对应机器中，见@fig:basic。采矿输入可以利用高级末影箱子进行传输，也可以在前期手动填入。

#figure(image("img/2025-08-15-11-53-00.drawio.svg"), caption: [流水线基本结构])<fig:basic>

= 末影导管+类型过滤器

前期的矿物处理方法。使用末影导管传输物品，使用 GT 类型过滤器进行产物分类。由于类型过滤器中只能输入对应类型的物品，所以可以把矿物与中间产物进行分类。缺点在于只能处理同一流程的矿物，如只能按“粉碎--粉碎--离心”的固定流程来处理矿物。

一般来说，前期只会做这样一个固定流程的矿物处理流水线，特殊处理的矿物会手动处理。@fig:t1 中视情况可以在类型过滤器后加入缓存，并增减离心机和磨粉机的数量。

#figure(image("img/2025-08-15-12-31-00.drawio.svg"), caption: [末影导管+类型过滤器流水线])<fig:t1>

= OC（开放式电脑）

在能够制造 OC 电脑之后，使用 OC 电脑+转运器进行产物的分类，然后使用管道将产物运输到对应机器。优点在于 OC 配件造价相对便宜，且功能灵活，可以自己设定逻辑，缺点在于需要编辑代码。在这个阶段，已经能够建成功能比较完善且扩展性强的流水线，唯一的约束就是 OC 转运器 5-20 组每秒（约数，实测约 5 组每秒）的转运速度上限。具体结构见@fig:t2。

#figure(image("img/2025-08-15-12-59-00.drawio.svg"), caption: [OC 流水线])<fig:t2>

关于 OC 转运器代码的编写，文章末尾的附录给出自用的参考版本。值得注意的是，OC 转运器无法获得矿物的矿物词典名称，从而需要根据矿物的英文名称直接进行分类，这导致了一些不便。部分矿物的命名规则不同（如风/火/水之魔晶等），需要特殊处理。而且部分矿物矿石和成品的名称相同（如花岗岩矿砂等），这会导致可能的分类错误。

关于转运器的摆放，可以参考源码进行分析。代码中需要用到三个转运器，每个转运器除了底面之外每个面均放置一个迷你箱进行交互（普通容器也可以，但是只会访问第一格的物品）。1 号转运器的顶部是输入端，其它均是输出端。由于两个转运器的输出端不够，故在 2 号转运器旁边接入 3 号转运器进行扩展。本程序的编写参考了 #link("https://github.com/S4mpsa/NIDAS/wiki/Ore-Processing")[NIDAS 项目中矿物处理的相关实现]，具体摆法也可以参考相关文档。

代码运行截图见@fig:t2-shot。

#figure(image("img/2025-08-05-13-08-01.png"), caption: [程序运行截图])<fig:t2-shot>

= AE（应用能源）

在进入到 ZPM 阶段后，虚空采矿机的采矿速度大幅提升。由于 OC 的转运速度存在上限，最终转向以 AE 矿典卡为核心的矿物处理流水线。设计 AE 网络对矿物进行分类和处理。

#figure(image("img/2025-08-15-13-19-00.drawio.svg"), caption: [AE 流水线])<fig:t3>

就@fig:t3，对于输入（矿物输入或机器弹出到一级子网中的物品）其大体可以分为若干步骤：先对其加工步骤进行分类（如铁矿石、粉碎铁矿石、含杂铁粉、纯净铁粉等分到“磨粉—洗矿—磨粉—离心”二级子网），在每个二级子网内依据矿石的形态分类到每个机器对应的子网中（如在前述二级子网中，将铁矿石分类到磨粉机三级子网，将含杂铁粉、纯净铁粉分类到离心机三级子网），然后在对应的三级子网中进行缓存。每个三级子网使用反向卡输出总线、矿典卡输出总线或者进阶存储输入总线等方式主动将原料从三级子网中抽出并送入机器中处理。机器处理后的产物统一弹回一级子网进行再分类。

关于熔炉、高炉和冷冻机的使用方面，由于主网对不同矿物需求的成品不同（有的需求锭，有的需求粉），故熔炉、高炉和冷冻机对应的三级子网直接接入一级子网进行分类，将需要烧成锭、或需要冷冻的特定类型产品进行标记即可。

由于有部分矿物需要单独产线进行处理（如独居石线、钽铁矿线等），这些矿物主网需求粉碎矿石或洗净的粉碎矿石，故将磨粉机、洗矿厂的三级子网也直接接入一级子网进行分类，将这种特殊处理的矿物直接写入对应存储总线。

部分矿物的粉可以直接离心，故将离心机三级子网也直接接入一级子网，将这部分矿物粉直接分类进入离心机进行离心。

一级子网向主网输出的总线优先级低于其它总线，这样所有未标记的成品（如锭、未特殊处理的矿物粉等）直接输出进入主网。

需要注意保持所有三级子网缓存有空余空间，否则流水线产生的多余矿物会直接进入主网，可能堵塞主网中的随机存储模块。

另附一级子网到各个二级子网的矿典分类脚本。

```
粉洗粉离
^(ore|rawOre|(crushed(Purified|Centrifuged)?)|dust(Pure|Impure))(Aluminium|Uvarovite|Perlite|Chromite|Barite|Powellite|MeteoricIron|Molybdenum|Molybdenite|Wulfenite|Beryllium|Ardite|Sulfur|Iron|Copper|Zinc|Silver|Tin|Lead|Bismuth|Redstone|Pyrite)$
^(ore|rawOre|(crushed(Purified|Centrifuged)?)|dust(Pure|Impure))(Saltpeter|Realgar|Cobalt|Gold|Glauconite|Gypsum|Uranium|Titanium|Oriharukon|Tungstate|Magnetite|Lithium|Scheelite|VanadiumMagnetite|Graphite|Mica|Calcite|Redstone|Arsenic|Antimony)$
^(ore|rawOre|(crushed(Purified|Centrifuged)?)|dust(Pure|Impure))(RoastedIron|Desh|Lepidolite|Zeolite|Kyanite|Draconium|BrownLimonite|YellowLimonite|Diatomite|Asbestos|Neodymium|Cryolite|Grossular|Spessartine|Tetrahedrite|Stibnite|Ferberite)$
^(ore|rawOre|(crushed(Purified|Centrifuged)?)|dust(Pure|Impure))(Loellingite|Roquesite|Bornite|Wittichenite|Djurleite|Huebnerite|RedDescloizite|Pentlandite|Arsenopyrite|RoastedNickel|Cobaltite|CallistoIce|Ledox|Alduorite|Rubracium|Orichalcum)$
^(ore|rawOre|(crushed(Purified|Centrifuged)?)|dust(Pure|Impure))(Chrome|Naquadah|NaquadahEnriched|InfusedGold|Ceruclase|Mytryl|Quantium|Vulcanite|DeepIron|Bismuthinite|Electrotine|GreenFuchsite|Magnesite|RedFuchsite|Tungsten|Rutile)$
^(ore|rawOre|(crushed(Purified|Centrifuged)?)|dust(Pure|Impure))(Plutonium241|Niobium|Pitchblende|CassiteriteSand|FullersEarth|GlauconiteSand|BasalticMineralSand|GraniticMineralSand|GarnetSand|Kaolinite|Bentonite|RockSalt|Salt|Silicon|Gallium)$
^(ore|rawOre|oreRaw|(crushed(Purified|Centrifuged)?)|dust(Pure|Impure))(Yttrium|Uranium235|Neutronium|Adamantium|Naquadria|ShadowIron|BlackPlutonium|Garnierite|HeeEndium|Soapstone|Irarsite|Osmium|AgarditeNd|Florencite|GadoliniteCe)$

粉洗筛
^(ore|rawOre|(crushed(Purified|Centrifuged)?)|dust(Pure|Impure))(Cinnabar|Firestone|CertusQuartz|NetherQuartz|Quartzite|Emerald|Diamond|Sapphire|GreenSapphire|Olivine|Topaz|Amethyst|Opal|Jasper|BlueTopaz|Amber|Sodalite|Lapis|GarnetRed|Apatite)$
^(ore|rawOre|(crushed(Purified|Centrifuged)?)|dust(Pure|Impure))(Jade|Lignite|InfusedAir|InfusedFire|InfusedEarth|InfusedWater|InfusedEntropy|InfusedOrder|Malachite|Spodumene|Ruby|Thorium|Coal|Lazurite|Cassiterite|Thorianite|Fayalite)$
^(ore|rawOre|(crushed(Purified|Centrifuged)?)|dust(Pure|Impure))(Forsterite|Hedenbergite|Tanzanite|GarnetYellow|FoolsRuby|Jasper|Bismutite|Chromo-Alumino-Povondraite|Fluor-Buergerite|Vanadio-Oxy-Dravite|Olenite|RedZircon|Vinteum|Prasiolite|Fluorspar)$
^(ore|rawOre|(crushed(Purified|Centrifuged)?)|dust(Pure|Impure))(TricalciumPhosphate|Tiberium|BArTiMaEuSNeK)$

粉洗热粉
^(ore|rawOre|(crushed(Purified|Centrifuged)?)|dust(Pure|Impure))(Pollucite|Uraninite|Pyrolusite|OrangeDescloizite|Pentlandite|Palladium|Chalcopyrite|Pyrochlore|Sphalerite)$

粉粉离
^(ore|rawOre|oreRaw|(crushed(Purified|Centrifuged)?)|dust(Pure|Impure))(RareEarthIII|RareEarthII|RareEarthI|Xenotime)$

粉化粉离
^(ore|rawOre|(crushed(Purified|Centrifuged)?)|dust(Pure|Impure))(Nickel|Mithril)$

粉化热粉
^(ore|rawOre|(crushed(Purified|Centrifuged)?)|dust(Pure|Impure))(Cooperite|Platinum|FluoriteF)$

粉化筛
^(ore|rawOre|(crushed(Purified|Centrifuged)?)|dust(Pure|Impure))Iridium$
```

= 附录

```lua
component = require("component")
sides = require("sides")
text = require("text")

MWMC = {
  "Aluminium",
  "Uvarovite",
  "Perlite",
  "Chromite",
  "Barite",
  "Powellite",
  "Meteoric Iron",
  "Molybdenum",
  "Molybdenite",
  "Wulfenite",
  "Beryllium",
  "Ardite",
  "Sulfur",
  "Iron",
  "Copper",
  "Zinc",
  "Silver",
  "Tin",
  "Lead",
  "Bismuth",
  "Redstone",
  "Pyrite",
  "Saltpeter",
  "Realgar",
  "Cobalt",
  "Gold",
  "Glauconite",
  "Gypsum",
  "Uranium 238",
  "Titanium",
  "Oriharukon",
  "Tungstate",
  "Magnetite",
  "Lithium",
  "Scheelite",
  "Vanadium Magnetite",
  "Graphite",
  "Mica",
  "Calcite",
  "Redstone",
  "Arsenic",
  "Antimony",
  "Roasted Iron",
  "Desh",
  "Lepidolite",
  "Zeolite",
  "Kyanite",
  "Draconium",
  "Brown Limonite",
  "Yellow Limonite",
  "Diatomite",
  "Asbestos",
  "Neodymium",
  "Cryolite",
  "Grossular",
  "Spessartine",
  "Tetrahedrite",
  "Stibnite",
  "Ferberite",
  "Loellingite",
  "Roquesite",
  "Bornite",
  "Wittichenite",
  "Djurleite",
  "Huebnerite",
  "Red Descloizite",
  "Pentlandite",
  "Arsenopyrite",
  "Roasted Nickel",
  "Cobaltite",
  "Callisto Ice",
  "Ledox",
  "Alduorite",
  "Rubracium",
  "Orichalcum",
  "Chrome",
  "Naquadah",
  "Enriched Naquadah",
  "Infused Gold",
  "Ceruclase",
  "Mytryl",
  "Quantium",
  "Vulcanite",
  "Deep Iron",
  "Bismuthinite",
  "Bastnasite",
  "Electrotine",
  "Green Fuchsite",
  "Magnesite",
  "Red Fuchsite",
  "Tungsten",
  "Rutile",
  "Plutonium 241",
  "Niobium"
}

MWS = {
  "Cinnabar",
  "Firestone",
  "Certus Quartz",
  "Nether Quartz",
  "Quartzite",
  "Emerald",
  "Diamond",
  "Sapphire",
  "Green Sapphire",
  "Olivine",
  "Topaz",
  "Amethyst",
  "Opal",
  "Jasper",
  "Blue Topaz",
  "Amber",
  "Sodalite",
  "Lapis",
  "Red Garnet",
  "Apatite",
  "Jade",
  "Lignite Coal",
  "Aer Crystals",
  "Ignis Crystals",
  "Terra Crystals",
  "Aqua Crystals",
  "Perditio Crystals",
  "Ordo Crystals",
  "Malachite",
  "Spodumene",
  "Ruby",
  "Thorium",
  "Coal",
  "Lazurite",
  "Cassiterite",
  "Thorianite",
  "Fayalite",
  "Forsterite",
  "Hedenbergite",
  "Tanzanite",
  "Yellow Garnet",
  "Spinel",
  "Jasper",
  "Bismutite",
  "Chromo-Alumino-Povondraite",
  "Fluor-Buergerite",
  "Vanadio-Oxy-Dravite",
  "Olenite",
  "Red Zircon",
  "Vinteum"
}

MWMC_ground = {
  "Pitchblende",
  "Cassiterite Sand",
  "Fullers Earth",
  "Glauconite Sand",
  "Basaltic Mineral Sand",
  "Granitic Mineral Sand",
  "Garnet Sand",
  "Kaolinite",
  "Bentonite"
}

MWMC_salt = {
  "Rock Salt",
  "Salt"
}

MMC = {
  -- "Rare Earth (III)",
  "Rare Earth (II)",
  "Rare Earth (I)"
}

MHMC = {
  "Nickel",
  "Mithril"
}

MWTM = {
  "Pollucite",
  "Uraninite",
  "Pyrolusite",
  "Orange Descloizite",
  "Pentlandite",
  "Palladium",
  "Chalcopyrite",
  "Pyrochlore"
}

MHTM = {
  "Sheldonite",
  "Platinum"
}

MHTM_fluorite = {
  "Fluorite (F)"
}

MHS = {
  "Iridium"
}

macerator = {
  "End Stone",
  "Unrefined Desh"
}

centrifuge = {
  "Impure Pile of Stone Dust",
  "Impure Pile of Endstone Dust",
  "Impure Pile of Netherrack Dust",
  "Impure Pile of Red Granite Dust",
  "Endstone Dust",
  "Pitchblende",
  "Vanadium Magnetite Dust"
}

washer = {
  "Crushed Galena Ore",
  "Crushed Sphalerite Ore",
  "Crushed Ilmenite Ore",
  "Crushed Bauxite Ore"
}

furnace = {
  "Gold Dust",
  "Zinc Dust",
  "Nickel Dust",
  "Copper Dust",
  "Tin Dust",
  "Lead Dust",
  "Iron Dust",
  "Silver Dust",
  "Beryllium Dust",
  "Manganese Dust",
  "Gallium Dust",
  "Molybdenum Dust",
  "Bismuth Dust",
  "Thorium Dust",
  "Invar Dust",
  "Cassiterite Sand",
  "Cinnabar Dust",
  "Pyrite Dust",
  "Magnetite Dust",
  "Basaltic Mineral Sand",
  "Granitic Mineral Sand",
  "Roasted Iron Dust",
  "Cassiterite Dust",
  "Sphalerite Dust",
  "Tetrahedrite Dust",
  "Banded Iron Dust",
  "Brown Limonite Dust",
  "Yellow Limonite Dust",
  "Stibnite Dust",
  "Cinnabar Dust"
}

sifter = {
}

blast_furnace = {
  "Aluminium Dust",
  "Raw Silicon Dust",
  "Silicon Solar Grade (Poly SI) Dust",
  "Cobalt Dust",
  "Niobium Dust",
  "Stainless Steel Dust",
  "Meteoric Iron Dust",
  "Conductive Iron Dust",
  "Ardite Dust",
  "Neodymium Dust"
}

bath_hg = {
}

thermal_centrifuge = {
}

for i = 1, #MWMC do
  table.insert(macerator, MWMC[i] .. " Ore")
  table.insert(macerator, "Raw " .. MWMC[i] .. " Ore")
  table.insert(washer, "Crushed " .. MWMC[i] .. " Ore")
  table.insert(macerator, "Purified " .. MWMC[i] .. " Ore")
  table.insert(centrifuge, "Purified Pile of " .. MWMC[i] .. " Dust")
  table.insert(centrifuge, "Impure Pile of " .. MWMC[i] .. " Dust")
end

for i = 1, #MHMC do
  table.insert(macerator, MHMC[i] .. " Ore")
  table.insert(macerator, "Raw " .. MHMC[i] .. " Ore")
  table.insert(bath_hg, "Crushed " .. MHMC[i] .. " Ore")
  table.insert(macerator, "Purified " .. MHMC[i] .. " Ore")
  table.insert(centrifuge, "Purified Pile of " .. MHMC[i] .. " Dust")
  table.insert(centrifuge, "Impure Pile of " .. MHMC[i] .. " Dust")
end

for i = 1, #MWMC_salt do
  table.insert(macerator, MWMC_salt[i] .. " Ore")
  table.insert(macerator, "Raw " .. MWMC_salt[i] .. " Ore")
  table.insert(washer, "Crushed " .. MWMC_salt[i] .. "Ore")
  table.insert(macerator, "Purified " .. MWMC_salt[i] .. "Ore")
  table.insert(centrifuge, "Purified Pile of " .. MWMC_salt[i])
  table.insert(centrifuge, "Impure Pile of " .. MWMC_salt[i])
end

for i = 1, #MWMC_ground do
  table.insert(macerator, MWMC_ground[i] .. " Ore")
  table.insert(washer, "Ground " .. MWMC_ground[i])
  table.insert(macerator, "Purified " .. MWMC_ground[i])
  table.insert(centrifuge, "Purified Pile of " .. MWMC_ground[i])
  table.insert(centrifuge, "Impure Pile of " .. MWMC_ground[i])
end

for i = 1, #MMC do
  table.insert(macerator, MMC[i] .. " Ore")
  table.insert(macerator, "Raw " .. MMC[i] .. " Ore")
  table.insert(macerator, "Crushed " .. MMC[i] .. " Ore")
  table.insert(centrifuge, "Impure " .. MMC[i] .. " Dust")
  table.insert(macerator, "Purified " .. MMC[i] .. " Ore")
  table.insert(centrifuge, "Purified Pile of " .. MMC[i] .. " Dust")
end

for i = 1, #MWS do
  table.insert(macerator, MWS[i] .. " Ore")
  table.insert(macerator, "Raw " .. MWS[i] .. " Ore")

  if (string.match(MWS[i], "Crystals$")) then
    table.insert(washer, "Crushed " .. MWS[i])
    table.insert(sifter, "Purified " .. MWS[i])
    table.insert(centrifuge, "Purified Pile of " .. MWS[i])
    table.insert(centrifuge, "Impure Pile of " .. MWS[i])
  else
    table.insert(washer, "Crushed " .. MWS[i] .. " Ore")
    table.insert(sifter, "Purified " .. MWS[i] .. " Ore")
    table.insert(centrifuge, "Purified Pile of " .. MWS[i] .. " Dust")
    table.insert(centrifuge, "Impure Pile of " .. MWS[i] .. " Dust")
  end
end

for i = 1, #MHS do
  table.insert(macerator, MHS[i] .. " Ore")
  table.insert(macerator, "Raw " .. MHS[i] .. " Ore")
  table.insert(bath_hg, "Crushed " .. MHS[i] .. " Ore")
  table.insert(sifter, "Purified " .. MHS[i] .. " Ore")
  table.insert(centrifuge, "Purified Pile of " .. MHS[i] .. " Dust")
  table.insert(centrifuge, "Impure Pile of " .. MHS[i] .. " Dust")
end

for i = 1, #MWTM do
  table.insert(macerator, "Raw " .. MWTM[i] .. " Ore")
  table.insert(washer, "Crushed " .. MWTM[i] .. " Ore")
  table.insert(thermal_centrifuge, "Purified " .. MWTM[i] .. " Ore")
  table.insert(macerator, "Centrifuged " .. MWTM[i] .. " Ore")
  table.insert(centrifuge, "Impure Pile of " .. MWTM[i] .. " Dust")
end

for i = 1, #MHTM do
  table.insert(macerator, MHTM[i] .. " Ore")
  table.insert(macerator, "Raw " .. MHTM[i] .. " Ore")
  table.insert(bath_hg, "Crushed " .. MHTM[i] .. " Ore")
  table.insert(thermal_centrifuge, "Purified " .. MHTM[i] .. " Ore")
  table.insert(macerator, "Centrifuged " .. MHTM[i] .. " Ore")
  table.insert(centrifuge, "Impure Pile of " .. MHTM[i] .. " Dust")
end

for i = 1, #MHTM_fluorite do
  table.insert(macerator, MHTM_fluorite[i] .. " Ore")
  table.insert(macerator, MHTM_fluorite[i] .. " Ore")
  table.insert(macerator, "Raw " .. MHTM_fluorite[i] .. " Ore")
  table.insert(bath_hg, "Crushed " .. MHTM_fluorite[i] .. " Ore")
  table.insert(thermal_centrifuge, "Purified Crushed " .. MHTM_fluorite[i] .. " Ore")
  table.insert(macerator, "Centrifuged Crushed " .. MHTM_fluorite[i] .. " Ore")
  table.insert(centrifuge, "Impure " .. MHTM_fluorite[i] .. " Dust")
  table.insert(centrifuge, "Purified " .. MHTM_fluorite[i] .. " Dust")
end

function is_in_table(tab, name)
  for _, v in ipairs(tab) do
    if (v == name) then
      return true
    end
  end
  return false
end

local trans1 = component.proxy("1c161709-7ead-4a5b-90c1-5990059bcfa4")
local trans2 = component.proxy("b5fdd6e6-6c7e-40a2-98e7-0b1004caa1a9")
local trans3 = component.proxy("043b57c3-fee6-4889-9dae-4d87887cb033")
local gpu = component.gpu
local w, h = gpu.getResolution()

while (true) do
  local info = trans1.getStackInSlot(sides.left, 1)
  local color = 0xFFFFFF
  local target_info = nil
  local log_in_screen = true

  if (info) then
    local target = ""
    if (is_in_table(macerator, info.label)) then
      target_info = trans1.getStackInSlot(sides.back, 1)
      trans1.transferItem(sides.left, sides.back, info.size, 1, 1)
      target = "Marcerator"
      color = 0xFF00FF
    else if (is_in_table(centrifuge, info.label)) then
      target_info = trans1.getStackInSlot(sides.right, 1)
      trans1.transferItem(sides.left, sides.right, info.size, 1, 1)
      target = "Centrifuge"
      color = 0xFF9200
    else if (is_in_table(washer, info.label)) then
      target_info = trans1.getStackInSlot(sides.front, 1)
      trans1.transferItem(sides.left, sides.front, info.size, 1, 1)
      target = "Washer"
      color = 0x002440
    else if (is_in_table(furnace, info.label)) then
      target_info = trans2.getStackInSlot(sides.back, 1)
      trans2.transferItem(sides.right, sides.back, info.size, 1, 1)
      target = "Furnace"
      color = 0x006D00
    else if (is_in_table(sifter, info.label)) then
      target_info = trans2.getStackInSlot(sides.up, 1)
      trans2.transferItem(sides.right, sides.up, info.size, 1, 1)
      target = "Sifter"
      color = 0xA5A5A5
    else if (is_in_table(blast_furnace, info.label)) then
      target_info = trans2.getStackInSlot(sides.front, 1)
      trans2.transferItem(sides.right, sides.front, info.size, 1, 1)
      target = "Blast Furnace"
      color = 0xFFFF00
    else if (
      is_in_table(bath_hg, info.label) or
      is_in_table(thermal_centrifuge, info.label)
    ) then
      target_info = trans2.getStackInSlot(sides.left, 1)
      trans2.transferItem(sides.right, sides.left, info.size, 1, 1)
      log_in_screen = false
    else
      target_info = trans1.getStackInSlot(sides.up, 1)
      trans1.transferItem(sides.left, sides.up, info.size, 1, 1)
      target = "Output"
    end end end end end end end

    if (not(target_info) and log_in_screen) then
      gpu.copy(1, 2, w, h - 1, 0, -1)
      gpu.set(1, h, string.format("%-5d  %-40s", info.size, info.label))
      gpu.setForeground(color)
      gpu.set(50, h, text.padRight(target, w - 49))
      gpu.setForeground(0xFFFFFF)
    end
  end

  info = trans3.getStackInSlot(sides.right, 1)
  color = 0xFFFFFF
  target_info = nil
  log_in_screen = true

  if (info) then
    if (is_in_table(bath_hg, info.label)) then
      target_info = trans3.getStackInSlot(sides.up, 1)
      trans3.transferItem(sides.right, sides.up, info.size, 1, 1)
      target = "Chemical Bath (Hg)"
      color = 0x00FF00
    else
      target_info = trans2.getStackInSlot(sides.back, 1)
      trans3.transferItem(sides.right, sides.back, info.size, 1, 1)
      target = "Thermal Centrifuge"
      color = 0xFF0000
    end

    if (not(target_info) and log_in_screen) then
      gpu.copy(1, 2, w, h - 1, 0, -1)
      gpu.set(1, h, string.format("%-5d  %-40s", info.size, info.label))
      gpu.setForeground(color)
      gpu.set(50, h, text.padRight(target, w - 49))
      gpu.setForeground(0xFFFFFF)
    end
  end
end
```

