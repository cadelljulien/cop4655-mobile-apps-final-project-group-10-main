//
//  Buildings.swift
//  Campus Parking Pal (CPP)
//
//  Created by Naama Scandarion on 11/24/23.
//

import Foundation

struct Building {
    let buildingName: String
    let buildingLocation: String
    let closestLot: String
    let buildingLatitude: Double
    let buildingLongitude: Double
    let parkingLatitude: Double
    let parkingLongitude: Double
}



extension Building {
    static var mockData: [Building] = [
        Building(buildingName: "Engineering East", buildingLocation: "Boca Raton Campus", closestLot: "Lot 96N", buildingLatitude: 26.37301, buildingLongitude: -80.09811, parkingLatitude: 26.37359, parkingLongitude: -80.09828),
        Building(buildingName: "College of Business", buildingLocation: "Boca Raton Campus", closestLot: "Lot 7", buildingLatitude: 26.37374054402143, buildingLongitude: -80.1044480529883, parkingLatitude: 26.374170670570834, parkingLongitude: -80.10569808853052),
        Building(buildingName: "College of Nursing", buildingLocation: "Boca Raton Campus", closestLot: "Lot 1", buildingLatitude: 26.371057490772586, buildingLongitude: -80.10061566454054, parkingLatitude: 26.370463174975583, parkingLongitude: -80.09916026716235),
        Building(buildingName: "College of Science", buildingLocation: "Boca Raton Campus", closestLot: "Lot 7", buildingLatitude: 26.37350651903282, buildingLongitude: -80.1015872508122, parkingLatitude: 26.374170670570834, parkingLongitude: -80.10569808853052),
        Building(buildingName: "Engineering West", buildingLocation: "Boca Raton Campus", closestLot: "Lot 19", buildingLatitude: 26.370724749528932, buildingLongitude: -80.10437994936193, parkingLatitude: 26.37147179117079, parkingLongitude: -80.1040478934553),
        Building(buildingName: "College of Education", buildingLocation: "Boca Raton Campus", closestLot: "Lot 7", buildingLatitude: 26.370724749528932, buildingLongitude: -80.10437994936193, parkingLatitude: 26.374170670570834, parkingLongitude: -80.10569808853052),
        Building(buildingName: "College of Medicine", buildingLocation: "Boca Raton Campus", closestLot: "Lot 4", buildingLatitude: 26.370724749528932, buildingLongitude: -80.10437994936193, parkingLatitude: 26.3742260710279, parkingLongitude: -80.09976078975502),
        Building(buildingName: "College of Social Work & Criminal Justice", buildingLocation: "Boca Raton Campus", closestLot: "Garage 2", buildingLatitude: 26.370724749528932, buildingLongitude: -80.10437994936193, parkingLatitude: 26.36904343967982, parkingLongitude: -80.09935704694294),
        Building(buildingName: "General Classroom North", buildingLocation: "Boca Raton Campus", closestLot: "Lot 4", buildingLatitude: 26.3742260710279, buildingLongitude: -80.10437994936193, parkingLatitude: 26.37147179117079, parkingLongitude: -80.09976078975502),
        Building(buildingName: "General Classroom South", buildingLocation: "Boca Raton Campus", closestLot: "Lot 19", buildingLatitude: 26.370724749528932, buildingLongitude: -80.10437994936193, parkingLatitude: 26.37147179117079, parkingLongitude: -80.1040478934553)
        ]
    }


