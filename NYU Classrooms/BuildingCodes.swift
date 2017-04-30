//
//  BuildingCodesDictionary.swift
//  NYU Classrooms
//
//  Created by Jonathan Philippou on 3/27/17.
//  Copyright © 2017 Conturbo Dev. All rights reserved.
//

import Foundation

// This class handles the dirty work of processing a building code.
// I created this class just to take the logic out of the controller
class BuildingCodes {
    
    // Looks up the address for a building code
    // Checks for nil and valid building code
    static func lookUpBuildingCode(buildingCode: String?) {
        if (buildingCode != nil) {
            // This line checks for a valid building code, upper case, and white space
            if let address: String = buildingCodes[buildingCode!.uppercased().trimmingCharacters(in: .whitespaces)] {
                // Look up the address on google maps for the user
                lookUpAddress(address: address)
            } else {
                // Show the user an error
                showErrorMessageForInvalidBuildingCode(buildingCode: buildingCode!)
            }
        } else {
            // building code == nil
            // do something if you want
        }
    }
    
    
    // Look up a given address on google maps
    static func lookUpAddress(address: String) {
        print(address)
    }
    
    
    // Show error message for invalid building code
    static func showErrorMessageForInvalidBuildingCode(buildingCode: String) {
        print("Error: Building Code '\(buildingCode)' not found")
    }
    
    
    // I didn't want to hard code the dictionary at first, but it importing it from the JSON file was tricky.
    // I figured it was easier to just copy/paste and change these '{ }' to these '[ ]'
    // We can go back and try to import it from the JSON file to clean things up whenever
    
    // Dictionary of NYU Building Codes
    // Key: Building Code
    // Value: Street Address
    static let buildingCodes = [
        "108B": "108 Broadway",
        "10AP": "10 Astor Place",
        "10WP": "10 Washington Place",
        "110F": "110 Fifth Avenue",
        "110W": "110 West 3rd Street Residence",
        "113U": "113 University Place",
        "11ST": "41 East 11th Street, 7th Floor",
        "12WV": "12 Waverly Place",
        "130M": "130 MacDougal Street",
        "133M": "130 MacDougal Street",
        "137M": "130 MacDougal Street",
        "14AWM": "14A Washington Mews",
        "142M": "142 Mulberry Street",
        "145F": "145 Fourth Avenue",
        "14UP": "14 University Place",
        "14WA": "14 Wall Street, Tandon School of Engineering",
        "15MTC": "15 MetroTech Center, Tandon School of Engineering",
        "15ST": "345 East 15th Street",
        "1633": "1633 Broadway",
        "194M": "194 Mercer Street",
        "199L": "199 Lafayette Street",
        "19UP": "19 University Place",
        "19W4": "19 West 4th Street",
        "19WS": "19 Washington Square North",
        "1E78": "The Institute of Fine Arts, 1 East 78th Street",
        "1WP": "1 Washington Place",
        "1WSN": "1 Washington Square North",
        "20CS": "20 Cooper Square",
        "214M": "214 Mercer Street",
        "230S": "230 Sullivan Street Residence",
        "239T": "239 Thompson Street",
        "240G": "240 Greene Street",
        "240M": "240 Mercer Street",
        "245S": "245 Sullivan Street",
        "246G": "246 Greene Street",
        "25W4": "25 West 4th Street",
        "25WV": "25 Waverly Place",
        "269M": "269 Mercer Street",
        "285M": "285 Mercer Street",
        "295L": "295 Lafayette Street",
        "29WW": "29 Washington Square East",
        "2AVE": "111 Second Avenue",
        "2BWY": "2 Broadway, Tandon School of Engineering",
        "2MTC": "2 MetroTech Center",
        "2ST": "2nd Street Residence Hall",
        "2UP": "2 University Place",
        "2WSN": "2 Washington Square North",
        "3-5W": "3-5 Washington Place",
        "333A": "33 Third Avenue",
        "342E": "342 East 26th Street, Room 200A",
        "345E": "345 East 24th Street",
        "380S": "380 Second Avenue, 4th Floor",
        "383L": "383 Lafayette Street",
        "3AVN": "Third Avenue North Dormitory",
        "3WSN": "3 Washington Square North",
        "411L": "411 Lafayette Street",
        "412W": "412 West 42nd Street, Playwright Theatre",
        "420W": "420 West 42nd Street",
        "423E": "Veterans Administration Hospital, 423 East 23rd Street",
        "440L": "440 Lafayette Street",
        "44CP": "44 Central Park West",
        "48CS": "48 Cooper Square",
        "4E14": "4 E. 14th St",
        "4WP": "4 Washington Place",
        "4WSN": "4 Washington Square North",
        "50WS": "50 Washington Square South",
        "51WS": "51 Washington Square South",
        "53WS": "53 Washington Square South",
        "55BS": "55 Broad Street, Tandon School of Engineering",
        "55BW": "55 Broadway, Tandon School of Engineering",
        "5WP": "5 Washington Place",
        "5WSN": "5 Washington Square North",
        "60FA": "60 Fifth Avenue",
        "622B": "622 Broadway",
        "665B": "665 Broadway",
        "686B": "686 Broadway",
        "6WP": "6 Washington Place",
        "715B": "715 Broadway",
        "719B": "719 Broadway",
        "721B": "721 Broadway",
        "725B": "725 Broadway",
        "726B": "726 Broadway",
        "730B": "730 Broadway",
        "75VA": "75 Varick Street (At Canal Street)",
        "770B": "770 Broadway",
        "7E12": "7 East 12th Street, Fairchild Building",
        "7ST": "7th Street Residence Hall",
        "80WS": "80 Washington Square East Gallery",
        "838B": "838 Broadway",
        "85W3": "85 West Third Street",
        "890B": "890 Broadway",
        "ADCC": "Abu Dhabi Country Club",
        "ADMA": "Abu Dhabi Marina",
        "AHCT": "Allied Health Center",
        "ALMS": "Al Muna School",
        "ALUM": "Alumni Hall",
        "AMAR": "American Arbitration Association",
        "ARC": "Academic Resource Center / 18 Washington Place",
        "BARN": "Barney Building",
        "BCHS": "Baruch College High School",
        "BDFS": "6 Bedford Square, London",
        "BERK": "Berkley School",
        "BOBS": "Bobst Library, 70 Washington Sq South",
        "BOST": "24 Bond Street",
        "BRBK": "Birkbeck College, London",
        "BRIT": "British Institute - Florence",
        "BRNF": "Bronfman Center",
        "BROM": "Broome Street Residence Hall",
        "BRTN": "Brittany Hall",
        "BRWN": "Brown Building",
        "BSCI": "Basic Science Building, 433 First Avenue",
        "BSTT": "Bassett Building, Tandon School of Engineering, Long Island",
        "BUTR": "Butterick Building",
        "BXPH": "Bronx Psychiatric Hospital",
        "CANT": "Cantor Film Center, 36 East 8th Street",
        "CARD": "Cardozo Law",
        "CARL": "Carlyle Court Residence Hall",
        "CASA": "24 West 12th Street, Casa Italiana",
        "CENT": "Centro Linguistico - Florence",
        "CHAN": "Chan House",
        "CIWW": "Courant Institute / Warren Weaver Hall",
        "COLE": "Coles Sports and Recreation Center",
        "COLU": "Columbia University",
        "COOP": "Cooper Union",
        "CORL": "Coral Tower Residence Hall",
        "CSAE": "Center for Science and Engineering, Abu Dhabi",
        "CVEN": "Civil Engineering Building, Tandon School of Engineering",
        "CUNY": "CUNY - City University of New York",
        "DAGA": "DâAgostino Hall",
        "DALT": "Dalton School",
        "DBN": "Dibner Building, Tandon School of Engineering",
        "DEUT": "Deutsches Haus",
        "DIBN": "Dibner Building, Tandon School of Engineering",
        "DOMN": "Dominican College",
        "DOWL": "Dowling College",
        "DTCN": "Downtown Campus - North, Abu Dhabi",
        "DTCS": "Downtown Campus - South, Abu Dhabi",
        "DTST": "Downtown Campus - Sama Tower, Abu Dhabi",
        "DUKE": "Duke House",
        "E15": "115 East 15th Street",
        "E34": "317 East 34th Street",
        "E7": "38-40 East 7th Street",
        "EAST": "East Building",
        "EDUC": "Education Building",
        "ERIN": "Ireland House",
        "FHBG": "Fuchsberg Hall, 249 Sullivan Street",
        "FORD": "Fordham University",
        "FOUN": "Founders Hall",
        "FRND": "Friends Seminary",
        "FURH": "J. Furman Hall",
        "GCASL": "Global Center for Academic & Spiritual Life / 238 Thompson Street",
        "GEOG": "Geography Building, Shanghai",
        "GIBB": "Katherine Gibbs",
        "GODD": "Paulette Goddard Hall, 45 West 4th Street",
        "GRAM": "Gramercy Green Residence Hall",
        "GWCH": "Greenwich Hotel",
        "GYMN": "Gymnasium, Tandon School of Engineering, Long Island",
        "HADY": "Hayden Hall",
        "HEBU": "Hebrew Union College",
        "HJTD": "Hospital for Joint Diseases",
        "ICPH": "International Center for Photography",
        "IFST": "Institute of French Studies",
        "IRMD": "Institute of Rehabilitation Medicine",
        "ISAW": "Institute for the Study of the Ancient World",
        "JABS": "Jacobs Academic Building, Tandon School of Engineering",
        "JCBS": "Jacobs Building, Tandon School of Engineering",
        "KAPL": "Kaplan Education Center, 16 Cooper Square",
        "KEVO": "Kevorkian Center",
        "KIMB": "Kimball Hall",
        "KIMM": "Helen and Martin Kimmel University Center, 60 Washington Sq South",
        "KING": "Kings College, London",
        "KJCC": "King Juan Carlos Center",
        "KMEC": "Henry Kaufman Management Education Center",
        "LENX": "Lenox Hill Hospital, 77th Street & Park Avenue",
        "LFAY": "80 Lafayette Street Residence Hall",
        "LINC": "Lincoln Center",
        "LIOM": "Lab Institute of Merchandising",
        "LITE": "Lighthouse, 111 East 59th Street",
        "LNZA": "Lanza",
        "LSTC": "539-541 LaGuardia Place Co-Op, Student Technology Center",
        "LYCM": "Lyceum - Florence",
        "MANV": "Manhattanville",
        "MAVA": "Manhattan Village Academy, 43 West 22nd Street",
        "MECH": "Mechanics Institute",
        "MEDS": "NYU Medical Center",
        "MEYR": "Meyer Hall, 4 Washington Place",
        "MIDC": "NYU Midtown Center",
        "MNBD": "Main Building, Tandon School of Engineering, Long Island",
        "MTMU": "Metropolitan Museum of Art",
        "NOF": "Nursing Off-Campus Clinical SiteÂ Click here for more details",
        "NTCT": "Norman Thomas High School",
        "NYBG": "New York Botanical Garden",
        "OFFC": "Off-Campus",
        "OIOC": "63 Downing Street",
        "ONAS": "58 West 10th Street",
        "ONLI": "On-Line",
        "PALL": "The Palladium Residence Hall",
        "PANX": "Pless Annex",
        "PHYS": "Physics Building, Shanghai",
        "PLSS": "Pless Building",
        "POST": "C.W. Post",
        "PREV": "Preventative Medicine Building",
        "PRSS": "Press Building",
        "PUBL": "Public Health",
        "PUER": "Puerto Rico",
        "RGSH": "Rogers Hall, Tandon School of Engineering",
        "RUBN": "Rubin Hall, 35 Fifth Avenue",
        "RUSK": "Rusk Institute, East 34th Street & First Avenue",
        "SAGC": "Saadiyat Golf Club",
        "SAHS": "Satellite AcademyÂ High School",
        "SALW": "Sarah Lawrence College",
        "SASS": "Sasseti",
        "SFOR": "Sterling Forest",
        "SHDS": "Schwartz Hall of Dental Science",
        "SHIM": "Shimkin Hall",
        "SILV": "Silver Center for Arts & Science, 100 Washington Sq East",
        "SLHB": "Schwartz Lecture Hall Building",
        "SNHS": "Senior House Residence Hall",
        "SHUL": "Senate House, University of London, London",
        "SOAA": "Tisch School of the Arts Asia / Singapore",
        "SOAS": "School of Oriental and African Studies, London",
        "SOJS": "SOJ Studio",
        "STAQ": "St. Thomas Aquinas College",
        "STAT": "Staten Island",
        "STRC": "Stern College",
        "STUY": "Stuyvesant Town",
        "SUNY": "Suny College of Optometry",
        "SYAC": "157-161 Gloucester St, Sydney, Australia",
        "TBA": "To Be Arranged",
        "TRB": "Translational Research Building, 227 East 30th Street",
        "THOM": "Thompson Center, 238 Thompson Street",
        "TISC": "Tisch Hall, 40 West 4th Street",
        "TRIN": "100 Trinity Place",
        "UHAL": "University Hall, 110 E. 14 St.",
        "ULIV": "Ulivi",
        "UTSL": "Building 4, Harris St & Thomas St, Sydney, Australia",
        "VAND": "Vanderbilt Hall",
        "VERN": "58 West 10th Street",
        "VIAC": "Viacom Center",
        "VIVO": "Vivo Institute",
        "VNAT": "Villa Natalia",
        "W13S": "West 13th Street Residence Hall",
        "W36": "19 West 36th Street",
        "W42": "416 West 42nd Street",
        "W56": "130 West 56th Street",
        "WAGN": "Wagner College",
        "WAVE": "Waverly Building, 24 Waverly Place",
        "WEIN": "Weinstein Residence Hall, 11 University Place",
        "WEIS": "Weissman Building",
        "WISE": "Wise Community Center",
        "WMEW": "Washington Mews",
        "WMNB": "Westchester Main Building,Â Tandon School of Engineering Westchester",
        "WOOL": "Woolworth Building",
        "WSQV": "Washington Square Village",
        "AD": "Abu Dhabi",
        "AF": "South Africa",
        "AM": "Amsterdam",
        "AR": "Africa",
        "AT": "Athens",
        "AU": "Austria",
        "BA": "Buenos Aires",
        "BC": "Branch At Dominican",
        "BD": "Budapest",
        "BE": "Bermuda",
        "BK": "Berkley School",
        "BL": "Berlin",
        "BR": "Britain",
        "BS": "Brussels",
        "BU": "Bulgaria",
        "BZ": "Brazil",
        "CA": "Cantor Film Center",
        "CB": "Cuba",
        "CE": "Chile",
        "CH": "China",
        "CL": "Cardoza Law",
        "CN": "Canada",
        "CR": "Costa Rica",
        "CS": "Cooper Square, 48 Cooper Square",
        "CT": "Cape Town",
        "CU": "Cooper Union, 51 Astor Place",
        "CW": "C.W. Post",
        "CY": "City Hall",
        "DA": "Dalton School, 108 East 89th Street",
        "DB": "Dublin",
        "DC": "Dental Center, 421 First Avenue",
        "DW": "Dowling",
        "EN": "England",
        "FA": "Inst. Of Fine Arts, 1 East 78th Street",
        "FC": "15th Street Center, 345 East 15th Street",
        "FL": "Florence",
        "FR": "France",
        "FS": "Friends Seminar, 222 East 16th Street",
        "GE": "Genoa",
        "GH": "Ghana",
        "GR": "Greece",
        "HC": "Hebrew Union College, 1 West 4th Street",
        "HI": "Hawaii",
        "HT": "Hong Kong & Taiwan",
        "IS": "Israel",
        "IT": "Italy",
        "JD": "Hospital for Joint Diseases",
        "KG": "Katherine Gibbs",
        "LH": "Lighthouse, 111 East 59th Street",
        "LM": "Lab Inst of Merchandising",
        "LO": "London",
        "LP": "La Pietra",
        "MC": "NYU Medical Center, 550 First Avenue",
        "MH": "Manhattanville",
        "MI": "Mechanics Institute",
        "MM": "Metropolitan Museum of Art",
        "MS": "Mount Sinai Medical Center",
        "MT": "Midtown Center, 11 West 42nd Street",
        "MV": "Manhattan Village Academy, 43 West 22nd Street",
        "MX": "Mexico",
        "NE": "Netherlands",
        "NI": "Nice",
        "NT": "Norman Thomas, 111 East 33rd Street",
        "OC": "Off-Campus",
        "OR": "Orlando",
        "PE": "Peru",
        "PG": "Prague",
        "PI": "Pisa",
        "PO": "Cracow",
        "PR": "Puerto Rico",
        "PS": "Paris",
        "PT": "Pretoria",
        "PU": "Stern Graduate at Purchase",
        "RU": "Russia",
        "SA": "Study Abroad",
        "SB": "Salzburg",
        "SC": "Stern College, 245 Lexington Avenue",
        "SF": "Sterling Forest",
        "SG": "Singapore",
        "SH": "Shanghai",
        "SI": "Staten Island",
        "SL": "Sarah Lawrence",
        "SN": "Senegal",
        "SP": "Spain",
        "SQ": "St. Thomas Aquinas College",
        "ST": "Stevens Institute of Technology",
        "SU": "Suny College of Optometry, 33 West 42nd Street",
        "SV": "Slovakia",
        "SW": "Sweden",
        "SZ": "Switzerland",
        "TA": "Tel Aviv",
        "TC": "SCPS Test Center, 50 Cooper Square, Room 300",
        "TU": "Tuscany",
        "UG": "Uganda",
        "VE": "Venice",
        "VI": "Viacom Center",
        "VK": "75 Varick Street (At Canal St.)",
        "VN": "Vietnam",
        "WA": "Wagner College",
        "WC": "Wise Community Center, 123 East 55th Street",
        "WS": "Washington Square",
        "WW": "Woolworth Building, 15 Barclay Street"
    ]
    

    static let detailedAddresses = [
        "108 Broadway": "108 Broadway, NY, NY",
        "10 Astor Place": "10 Astor Place, NY, NY",
        "10 Washington Place": "10 Washington Place, NY, NY",
        "110 Fifth Avenue":"110 Fifth Avenue, NY, NY",
        "110 West 3rd Street Residence":"110 West 3rd Street, NY, NY",
        "113 University Place":"113 University Place, NY, NY",
        "41 East 11th Street, 7th Floor":"41 East 11th Street, NY, NY",
        "12 Waverly Place":"12 Waverly Place, New York, NY",
        "130 MacDougal Street":"130 MacDougal Street, NY, NY",
        "14A Washington Mews":"14A Washington Mews, NY, NY",
        "142 Mulberry Street":"142 Mulberry Street, NY, NY",
        "145 Fourth Avenue":"145 Fourth Avenue,NY, NY",
        "14 University Place":"14 University Place, NY, NY",
        "14 Wall Street, Tandon School of Engineering": "14 Wall Street, NY, NY",
        "15 MetroTech Center": "15 MetroTech Center, Brooklyn, NY",
        "345 East 15th Street": "345 East 15th Street, NY, NY",
        "1633 Broadway":"1633 Broadway, NY, NY",
        "194 Mercer Street":"194 Mercer Street, NY, NY",
        "199 Lafayette Street":"199 Lafayette Street, NY, NY",
        "19 University Place":"19 University Place, NY, NY",
        "19 West 4th Street":"19 West 4th Street, NY, NY",
        "19 Washington Square North":"19 Washington Square North, NY, NY",
        "The Institute of Fine Arts, 1 East 78th Street": "1 East 78th Street, NY, NY",
        "1 Washington Place":"1 Washington Place, NY, NY",
        "1 Washington Square North":"1 Washington Square North, NY, NY",
        "20 Cooper Square":"20 Cooper Square, NY, NY",
        "214 Mercer Street":"214 Mercer Street, NY, NY",
        "230 Sullivan Street Residence":"230 Sullivan Street, NY, NY",
        "239 Thompson Street":"239 Thompson Street, NY, NY",
        "240 Greene Street":"240 Greene Street, NY, NY",
        "240 Mercer Street":"240 Mercer Street, NY, NY",
        "245 Sullivan Street":"245 Sullivan Street, NY, NY",
        "246 Greene Street":"246 Greene Street, NY, NY",
        "25 West 4th Street":"25 West 4th Street, NY, NY",
        "25 Waverly Place":"25 Waverly Place, NY, NY",
        "269 Mercer Street": "269 Mercer Street, NY, NY",
        "285 Mercer Street":"285 Mercer Street, NY, NY",
        "295 Lafayette Street":"295 Lafayette Street, NY, NY",
        "29 Washington Square East":"29 Washington Square East, NY, NY",
        "111 Second Avenue":"111 Second Avenue, NY, NY",
        "2 Broadway, Tandon School of Engineering":"2 Broadway, NY, NY",
        "2 MetroTech Center": "2 MetroTech Center, Brooklyn, NY",
        "2nd Street Residence Hall":"317 Bowery, NY,NY",
        "2 University Place": "2 University Place, NY, NY",
        "2 Washington Square North":"2 Washington Square North, NY, NY",
        "3-5 Washington Place":"3-5 Washington Place, NY, NY",
        "33 Third Avenue":"33 Third Avenue, NY, NY",
        "342 East 26th Street, Room 200A":"342 East 26th Street, NY, NY",
        "345 East 24th Street":"345 East 24th Street, NY, NY",
        "380 Second Avenue, 4th Floor":"380 Second Avenue, NY, NY",
        "383 Lafayette Street":"383 Lafayette Street, NY, NY",
        "Third Avenue North Dormitory":"75 3rd Ave, NY, NY",
        "3 Washington Square North":"3 Washington Square North, NY, NY",
        "411 Lafayette Street":"411 Lafayette Street, NY, NY",
        "412 West 42nd Street, Playwright Theatre":"412 West 42nd Street, NY, NY",
        "420 West 42nd Street":"420 West 42nd Street, NY, NY",
        "Veterans Administration Hospital, 423 East 23rd Street":"423 East 23rd Street, NY, NY",
        "440 Lafayette Street":"440 Lafayette Street, NY, NY",
        "44 Central Park West":"44 Central Park West, NY, NY",
        "48 Cooper Square":"48 Cooper Square, NY, NY",
        "4 E. 14th St":"4 E. 14th St, NY, NY",
        "4 Washington Place":"4 Washington Place, NY, NY",
        "4 Washington Square North":"4 Washington Square North, NY, NY",
        "50 Washington Square South":"50 Washington Square South, NY, NY",
        "51 Washington Square South":"51 Washington Square South, NY, NY",
        "53 Washington Square South":"53 Washington Square South, NY, NY",
        "55 Broad Street, Tandon School of Engineering":"55 Broad Street, Brooklyn, NY",
        "55 Broadway, Tandon School of Engineering":"55 Broadway, NY, NY",
        "5 Washington Place":"5 Washington Place, NY, NY",
        "5 Washington Square North":"5 Washington Square North, NY, NY",
        "60 Fifth Avenue":"60 Fifth Avenue, NY, NY",
        "622 Broadway":"622 Broadway, NY, NY",
        "665 Broadway":"665 Broadway, NY, NY",
        "686 Broadway":"686 Broadway, NY, NY",
        "6 Washington Place":"6 Washington Place, NY, NY",
        "715 Broadway":"715 Broadway, NY, NY",
        "719 Broadway":"719 Broadway, NY, NY",
        "721 Broadway":"721 Broadway, NY, NY",
        "725 Broadway":"725 Broadway, NY, NY",
        "726 Broadway":"726 Broadway, NY, NY",
        "730 Broadway":"730 Broadway, NY, NY",
        "75 Varick Street (At Canal Street)":"75 Varick Street, NY, NY",
        "770 Broadway":"770 Broadway, NY, NY",
        "7 East 12th Street, Fairchild Building":"7 East 12th Street, NY, NY",
        "7th Street Residence Hall":"40 East 7th Street, NY, NY",
        "80 Washington Square East Gallery":"80 Washington Square East, NY, NY",
        "838 Broadway":"838 Broadway, NY, NY",
        "85 West Third Street":"85 West Third Street, NY, NY",
        "890 Broadway":"890 Broadway, NY, NY",
        "Abu Dhabi Country Club":"Abu Dhabi Country Club",
        "Abu Dhabi Marina":"Abu Dhabi Marina",
        "Allied Health Center":"",
        "Al Muna School":"",
        "Alumni Hall":"",
        "American Arbitration Association":"",
        "Academic Resource Center / 18 Washington Place":"",
        "Barney Building":"",
        "Baruch College High School":"",
        "6 Bedford Square, London":"",
        "Berkley School":"",
        "Bobst Library, 70 Washington Sq South":"",
        "24 Bond Street":"",
        "Birkbeck College, London":"",
        "British Institute - Florence":"",
        "Bronfman Center":"",
        "Broome Street Residence Hall":"",
        "Brittany Hall":"",
        "Brown Building":"",
        "Basic Science Building, 433 First Avenue":"",
        "Bassett Building, Tandon School of Engineering, Long Island":"",
        "Butterick Building":"",
        "Bronx Psychiatric Hospital":"",
        "Cantor Film Center, 36 East 8th Street":"",
        "Cardozo Law":"",
        "Carlyle Court Residence Hall":"",
        "24 West 12th Street, Casa Italiana":"",
        "Centro Linguistico - Florence":"",
        "Chan House":"",
        "Courant Institute / Warren Weaver Hall":"",
        "Coles Sports and Recreation Center":"",
        "Columbia University":"",
        "Cooper Union":"",
        "Coral Tower Residence Hall":"",
        "Center for Science and Engineering, Abu Dhabi":"",
        "Civil Engineering Building, Tandon School of Engineering":"",
        "CUNY - City University of New York":"",
        "DâAgostino Hall":"",
        "Dalton School":"",
        "Dibner Building, Tandon School of Engineering":"",
        "Deutsches Haus":"",
        "Dominican College":"",
        "Dowling College":"",
        "Downtown Campus - North, Abu Dhabi":"",
        "Downtown Campus - South, Abu Dhabi":"",
        "Downtown Campus - Sama Tower, Abu Dhabi":"",
        "Duke House":"",
        "115 East 15th Street":"",
        "317 East 34th Street":"",
        "38-40 East 7th Street":"",
        "East Building":"",
        "Education Building":"",
        "Ireland House":"",
        "Fuchsberg Hall, 249 Sullivan Street":"",
        "Fordham University":"",
        "Founders Hall":"",
        "Friends Seminary":"",
        "J. Furman Hall":"",
        "Global Center for Academic & Spiritual Life / 238 Thompson Street":"",
        "Geography Building, Shanghai":"",
        "Katherine Gibbs":"",
        "Paulette Goddard Hall, 45 West 4th Street":"",
        "Gramercy Green Residence Hall":"",
        "Greenwich Hotel":"",
        "Gymnasium, Tandon School of Engineering, Long Island":"",
        "Hayden Hall":"",
        "Hebrew Union College":"",
        "Hospital for Joint Diseases":"",
        "International Center for Photography":"",
        "Institute of French Studies":"",
        "Institute of Rehabilitation Medicine":"",
        "Institute for the Study of the Ancient World":"",
        "Jacobs Academic Building, Tandon School of Engineering":"",
        "Jacobs Building, Tandon School of Engineering":"",
        "Kaplan Education Center, 16 Cooper Square":"",
        "Kevorkian Center":"",
        "Kimball Hall":"",
        "Helen and Martin Kimmel University Center, 60 Washington Sq South":"",
        "Kings College, London":"",
        "King Juan Carlos Center":"",
        "Henry Kaufman Management Education Center":"",
        "Lenox Hill Hospital, 77th Street & Park Avenue":"",
        "80 Lafayette Street Residence Hall":"",
        "Lincoln Center":"",
        "Lab Institute of Merchandising":"",
        "Lighthouse, 111 East 59th Street":"",
        "Lanza":"",
        "539-541 LaGuardia Place Co-Op, Student Technology Center":"",
        "Lyceum - Florence":"",
        "Manhattanville":"",
        "Manhattan Village Academy, 43 West 22nd Street":"",
        "Mechanics Institute":"",
        "NYU Medical Center":"",
        "Meyer Hall, 4 Washington Place":"",
        "NYU Midtown Center":"",
        "Main Building, Tandon School of Engineering, Long Island":"",
        "Metropolitan Museum of Art":"",
        "Nursing Off-Campus Clinical SiteÂ Click here for more details":"",
        "Norman Thomas High School":"",
        "New York Botanical Garden":"",
        "Off-Campus":"",
        "63 Downing Street":"",
        "58 West 10th Street":"",
        "On-Line":"",
        "The Palladium Residence Hall":"",
        "Pless Annex":"",
        "Physics Building, Shanghai":"",
        "Pless Building":"",
        "C.W. Post":"",
        "Preventative Medicine Building":"",
        "Press Building":"",
        "Public Health":"",
        "Puerto Rico":"",
        "Rogers Hall, Tandon School of Engineering":"",
        "Rubin Hall, 35 Fifth Avenue":"",
        "Rusk Institute, East 34th Street & First Avenue":"",
        "Saadiyat Golf Club":"",
        "Satellite Academy High School":"",
        "Sarah Lawrence College":"",
        "Sasseti":"",
        "Sterling Forest":"",
        "Schwartz Hall of Dental Science":"",
        "Shimkin Hall":"",
        "Silver Center for Arts & Science, 100 Washington Sq East":"",
        "Schwartz Lecture Hall Building":"",
        "Senior House Residence Hall":"",
        "Senate House, University of London, London":"",
        "Tisch School of the Arts Asia / Singapore":"",
        "School of Oriental and African Studies, London":"",
        "SOJ Studio":"",
        "St. Thomas Aquinas College":"",
        "Staten Island":"",
        "Stern College":"",
        "Stuyvesant Town":"",
        "Suny College of Optometry":"",
        "157-161 Gloucester St, Sydney, Australia":"",
        "To Be Arranged":"",
        "Translational Research Building, 227 East 30th Street":"",
        "Thompson Center, 238 Thompson Street":"",
        "Tisch Hall, 40 West 4th Street":"",
        "100 Trinity Place":"",
        "University Hall, 110 E. 14 St.":"",
        "Ulivi":"",
        "Building 4, Harris St & Thomas St, Sydney, Australia":"",
        "Vanderbilt Hall":"",
        "Viacom Center":"",
        "Vivo Institute":"",
        "Villa Natalia":"",
        "West 13th Street Residence Hall":"",
        "19 West 36th Street":"19 West 36th Street, NY, NY",
        "416 West 42nd Street":"416 West 42nd Street, NY, NY",
        "130 West 56th Street":"130 West 56th Street, NY, NY",
        "Wagner College":"295 Lafayette St, NY, NY",
        "Waverly Building, 24 Waverly Place":"24 Waverly Place, NY, NY",
        "Weinstein Residence Hall, 11 University Place":"11 University Place, NY, NY",
        "Weissman Building":"Weissman Building",
        "Wise Community Center":"Wise Community Center",
        "Washington Mews":"Washington Mews, NY, NY",
        "Westchester Main Building,Â Tandon School of Engineering Westchester":"NYU Tandon School of Engineering",
        "Woolworth Building":"Washington Square Village",
        "Washington Square Village":"Washington Square Village, NY, NY",
        "Abu Dhabi":"Abu Dhabi",
        "South Africa":"South Africa",
        "Amsterdam":"Amsterdam, Netherlands",
        "Africa":"Africa",
        "Athens":"Athens",
        "Austria":"Austria",
        "Buenos Aires":"Buenos Aires, Argentina",
        "Branch At Dominican":"Dominican Republic",
        "Budapest":"Budapest",
        "Bermuda":"Bermuda",
        "Berlin":"Berlin, Germany",
        "Britain":"Britain",
        "Brussels":"Brussels",
        "Bulgaria":"Bulgaria",
        "Brazil":"Brazil",
        "Cantor Film Center":"36 East 8th Street, NY, NY",
        "Cuba":"Cuba",
        "Chile":"Chile",
        "China":"China",
        "Cardoza Law":"55 5th Ave, NY, NY",
        "Canada":"Canada",
        "Costa Rica":"Costa Rica",
        "Cooper Square, 48 Cooper Square":"48 Cooper Square, NY, NY",
        "Cape Town":"Cape Town, South Africa",
        "Cooper Union, 51 Astor Place":"51 Astor Place, NY, NY",
        "City Hall":"City Hall, NY, NY",
        "Dalton School, 108 East 89th Street":"108 East 89th Street, NY, NY",
        "Dublin":"Dublin, Ireland",
        "Dental Center, 421 First Avenue":"421 First Avenue, NY, NY",
        "Dowling":"Dowling College Manhattan",
        "England":"England",
        "Inst. Of Fine Arts, 1 East 78th Street":"1 East 78th Street, NY, NY",
        "15th Street Center, 345 East 15th Street":"345 East 15th Street, NY, NY",
        "Florence":"Florence",
        "France":"France",
        "Friends Seminar, 222 East 16th Street":"222 East 16th Street, NY, NY",
        "Genoa":"Genoa, Italy",
        "Ghana":"Ghana",
        "Greece":"Greece",
        "Hebrew Union College, 1 West 4th Street":"1 West 4th Street, NY, NY",
        "Hawaii":"Hawaii, USA",
        "Hong Kong & Taiwan":"Hong Kong",
        "Israel":"Israel",
        "Italy":"Italy",
        "Lab Inst of Merchandising":"12 E 53rd St, NY, NY",
        "London":"London, England",
        "La Pietra":"La Pietra, Florence, Italy",
        "NYU Medical Center, 550 First Avenue":"550 First Avenue, NY, NY",
        "Mount Sinai Medical Center":"Mount Sinai Medical Center",
        "Midtown Center, 11 West 42nd Street":" 11 West 42nd Street, NY, NY",
        "Mexico":"Mexico",
        "Netherlands":"Netherlands",
        "Nice":"Nice, France",
        "Norman Thomas, 111 East 33rd Street":"111 East 33rd Street, NY, NY",
        "Orlando":"Orlando, Florida",
        "Peru":"Peru",
        "Prague":"Prague, Czechia",
        "Pisa":"Pisa, Italy",
        "Cracow":"Cracow, poland",
        "Paris":"Paris, France",
        "Pretoria":"Pretoria",
        "Stern Graduate at Purchase":"735 Anderson Hill Rd, Purchase, NY",
        "Russia":"Russia",
        "Study Abroad":"383 Lafayette, NY, NY",
        "Salzburg":"Salzburg",
        "Stern College, 245 Lexington Avenue":"245 Lexington Avenue, NY, NY",
        "Singapore":"Singapore",
        "Shanghai":"Shanghai",
        "Sarah Lawrence":"Sarah Lawrence",
        "Senegal":"Senegal",
        "Spain":"Spain",
        "Stevens Institute of Technology":"Stevens Institute of Technology",
        "Suny College of Optometry, 33 West 42nd Street":"33 West 42nd Street, NY, NY",
        "Slovakia":"Slovakia",
        "Sweden":"Sweden",
        "Switzerland":"Switzerland",
        "Tel Aviv":"Tel Aviv, Israel",
        "SCPS Test Center, 50 Cooper Square, Room 300":"50 Cooper Square, NY, NY",
        "Tuscany":"Tuscany, Italy",
        "Uganda":"Uganda",
        "Venice":"Venice",
        "75 Varick Street (At Canal St.)":"75 Varick Street, NY, NY",
        "Vietnam":"Vietnam",
        "Wise Community Center, 123 East 55th Street":"123 East 55th Street, NY, NY",
        "Washington Square":"Washington Square Park, NY, NY",
        "Woolworth Building, 15 Barclay Street":"Woolworth Building"
    ]
}
