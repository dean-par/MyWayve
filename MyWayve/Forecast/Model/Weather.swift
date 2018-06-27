//
//  Weather.swift
//  MyWayve
//
//  Created by Dean Parreno on 9/6/18.
//  Copyright © 2018 DeanParreno. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let data: WeatherDetail
}

struct WeatherDetail: Codable {
    let request: [Request]
    let weather: [Weather]
}

struct Request: Codable {
    let type: String
    let query: String
}

struct Weather: Codable {
    let date: String
    let astronomy: [Astronomy]
    let maxtempC: String
    let maxtempF: String
    let mintempC: String
    let mintempF: String
    let tides: [Tide]
    let hourly: [HourlyWeather]
    
}

struct Astronomy: Codable {
    
    let sunset: String
    let moonrise: String
    let moonset: String
    let moonPhase: String
    let moonIllumination: String
    
    enum CodingKeys: String, CodingKey {
        case sunset, moonrise, moonset, moonPhase = "moon_phase", moonIllumination = "moon_illumination"
    }
}

struct Tide: Codable {
    let tideData: [TideData]
    
    enum CodingKeys: String, CodingKey {
        case tideData = "tide_data"
    }
}

struct TideData: Codable {
    
    let tideTime: String
    let tideHeightInMetres: String
    let tideDateTime: String
    let tideType: String
    
    enum CodingKeys: String, CodingKey {
        case tideTime, tideHeightInMetres = "tideHeight_mt", tideDateTime, tideType = "tide_type"
    }
    
}

struct HourlyWeather: Codable {
    // TODO: make the type appropriate instead of all strings.
    let time: String
    let tempC: String
    let tempF: String
    let windspeedMiles: String
    let windspeedKmph: String
    let winddirDegree: String
    let winddir16Point: String
    let weatherCode: String
    let weatherIconUrl: [WeatherIcon]
    let weatherDesc: [WeatherDescription]
    let precipMM: String
    let humidity: String
    let pressure: String
    let visibility: String
    let cloudcover: String
    let HeatIndexC: String
    let HeatIndexF: String
    let DewPointC: String
    let DewPointF: String
    let WindChillC: String
    let WindChillF: String
    let WindGustMiles: String
    let WindGustKmph: String
    let FeelsLikeC: String
    let FeelsLikeF: String
    let sigHeight_m: String
    let swellHeight_m: String
    let swellHeight_ft: String
    let swellDir: String
    let swellDir16Point: String
    let swellPeriod_secs: String
    let waterTemp_C: String
    let waterTemp_F: String
}

struct WeatherIcon: Codable {
    let value: String
}

struct WeatherDescription: Codable {
    let value: String
}
    //{
    //        "time": "0",
    //        "tempC": "18",
    //        "tempF": "64",
    //        "windspeedMiles": "15",
    //        "windspeedKmph": "24",
    //        "winddirDegree": "298",
    //        "winddir16Point": "WNW",
    //        "weatherCode": "122",
    //        "weatherIconUrl": [
    //        {
    //        "value": "http://cdn.worldweatheronline.net/images/wsymbols01_png_64/wsymbol_0004_black_low_cloud.png"
    //        }
    //        ],
    //        "weatherDesc": [
    //        {
    //        "value": "Overcast"
    //        }
    //        ],
    //        "precipMM": "0.0",
    //        "humidity": "68",
    //        "visibility": "10",
    //        "pressure": "1023",
    //        "cloudcover": "89",
    //        "HeatIndexC": "18",
    //        "HeatIndexF": "64",
    //        "DewPointC": "12",
    //        "DewPointF": "53",
    //        "WindChillC": "18",
    //        "WindChillF": "64",
    //        "WindGustMiles": "29",
    //        "WindGustKmph": "46",
    //        "FeelsLikeC": "18",
    //        "FeelsLikeF": "64",
    //        "sigHeight_m": "0.8",
    //        "swellHeight_m": "0.5",
    //        "swellHeight_ft": "1.6",
    //        "swellDir": "50",
    //        "swellDir16Point": "NE",
    //        "swellPeriod_secs": "6.0",
    //        "waterTemp_C": "21",
    //        "waterTemp_F": "70"
    //        },
    //        {
    //        "time": "100",
    //        "tempC": "18",
    
    



//{
//    "data": {
//        "request": [
//        {
//        "type": "LatLon",
//        "query": "Lat -33.81 and Lon 151.12"
//        }
//        ],
//        "weather": [
//        {
//        "date": "2018-06-09",
//        "astronomy": [
//        {
//        "sunrise": "06:56 AM",
//        "sunset": "04:53 PM",
//        "moonrise": "01:30 AM",
//        "moonset": "01:47 PM",
//        "moon_phase": "Waning Crescent",
//        "moon_illumination": "34"
//        }
//        ],
//        "maxtempC": "18",
//        "maxtempF": "64",
//        "mintempC": "16",
//        "mintempF": "61",
//        "tides": [
//        {
//        "tide_data": [
//        {
//        "tideTime": "3:49 AM",
//        "tideHeight_mt": "1.35",
//        "tideDateTime": "2018-06-09 03:49",
//        "tide_type": "HIGH"
//        },
//        {
//        "tideTime": "10:15 AM",
//        "tideHeight_mt": "0.41",
//        "tideDateTime": "2018-06-09 10:15",
//        "tide_type": "LOW"
//        },
//        {
//        "tideTime": "4:43 PM",
//        "tideHeight_mt": "1.45",
//        "tideDateTime": "2018-06-09 16:43",
//        "tide_type": "HIGH"
//        },
//        {
//        "tideTime": "10:51 PM",
//        "tideHeight_mt": "0.55",
//        "tideDateTime": "2018-06-09 22:51",
//        "tide_type": "LOW"
//        }
//        ]
//        }
//        ],
//        "hourly": [
//        {
//        "time": "0",
//        "tempC": "18",
//        "tempF": "64",
//        "windspeedMiles": "15",
//        "windspeedKmph": "24",
//        "winddirDegree": "298",
//        "winddir16Point": "WNW",
//        "weatherCode": "122",
//        "weatherIconUrl": [
//        {
//        "value": "http://cdn.worldweatheronline.net/images/wsymbols01_png_64/wsymbol_0004_black_low_cloud.png"
//        }
//        ],
//        "weatherDesc": [
//        {
//        "value": "Overcast"
//        }
//        ],
//        "precipMM": "0.0",
//        "humidity": "68",
//        "visibility": "10",
//        "pressure": "1023",
//        "cloudcover": "89",
//        "HeatIndexC": "18",
//        "HeatIndexF": "64",
//        "DewPointC": "12",
//        "DewPointF": "53",
//        "WindChillC": "18",
//        "WindChillF": "64",
//        "WindGustMiles": "29",
//        "WindGustKmph": "46",
//        "FeelsLikeC": "18",
//        "FeelsLikeF": "64",
//        "sigHeight_m": "0.8",
//        "swellHeight_m": "0.5",
//        "swellHeight_ft": "1.6",
//        "swellDir": "50",
//        "swellDir16Point": "NE",
//        "swellPeriod_secs": "6.0",
//        "waterTemp_C": "21",
//        "waterTemp_F": "70"
//        },
//        {
//        "time": "100",
//        "tempC": "18",
//        "tempF": "64",
//        "windspeedMiles": "14",
//        "windspeedKmph": "23",
//        "winddirDegree": "298",
//        "winddir16Point": "WNW",
//        "weatherCode": "122",
//        "weatherIconUrl": [
//        {
//        "value": "http://cdn.worldweatheronline.net/images/wsymbols01_png_64/wsymbol_0004_black_low_cloud.png"
//        }
//        ],
//        "weatherDesc": [
//        {
//        "value": "Overcast"
//        }
//        ],
//        "precipMM": "0.0",
//        "humidity": "70",
//        "visibility": "10",
//        "pressure": "1023",
//        "cloudcover": "92",
//        "HeatIndexC": "18",
//        "HeatIndexF": "64",
//        "DewPointC": "12",
//        "DewPointF": "54",
//        "WindChillC": "18",
//        "WindChillF": "64",
//        "WindGustMiles": "24",
//        "WindGustKmph": "39",
//        "FeelsLikeC": "18",
//        "FeelsLikeF": "64",
//        "sigHeight_m": "0.8",
//        "swellHeight_m": "0.5",
//        "swellHeight_ft": "1.6",
//        "swellDir": "53",
//        "swellDir16Point": "NE",
//        "swellPeriod_secs": "6.0",
//        "waterTemp_C": "21",
//        "waterTemp_F": "70"
//        },
//        {
//        "time": "200",
//        "tempC": "17",
//        "tempF": "63",
//        "windspeedMiles": "13",
//        "windspeedKmph": "22",
//        "winddirDegree": "298",
//        "winddir16Point": "WNW",
//        "weatherCode": "122",
//        "weatherIconUrl": [
//        {
//        "value": "http://cdn.worldweatheronline.net/images/wsymbols01_png_64/wsymbol_0004_black_low_cloud.png"
//        }
//        ],
//        "weatherDesc": [
//        {
//        "value": "Overcast"
//        }
//        ],
//        "precipMM": "0.0",
//        "humidity": "73",
//        "visibility": "10",
//        "pressure": "1022",
//        "cloudcover": "95",
//        "HeatIndexC": "17",
//        "HeatIndexF": "63",
//        "DewPointC": "12",
//        "DewPointF": "54",
//        "WindChillC": "17",
//        "WindChillF": "63",
//        "WindGustMiles": "20",
//        "WindGustKmph": "32",
//        "FeelsLikeC": "17",
//        "FeelsLikeF": "63",
//        "sigHeight_m": "0.7",
//        "swellHeight_m": "0.5",
//        "swellHeight_ft": "1.6",
//        "swellDir": "57",
//        "swellDir16Point": "ENE",
//        "swellPeriod_secs": "6.0",
//        "waterTemp_C": "21",
//        "waterTemp_F": "70"
//        },
//        {
//        "time": "300",
//        "tempC": "17",
//        "tempF": "62",
//        "windspeedMiles": "13",
//        "windspeedKmph": "20",
//        "winddirDegree": "298",
//        "winddir16Point": "WNW",
//        "weatherCode": "122",
//        "weatherIconUrl": [
//        {
//        "value": "http://cdn.worldweatheronline.net/images/wsymbols01_png_64/wsymbol_0004_black_low_cloud.png"
//        }
//        ],
//        "weatherDesc": [
//        {
//        "value": "Overcast"
//        }
//        ],
//        "precipMM": "0.0",
//        "humidity": "75",
//        "visibility": "10",
//        "pressure": "1022",
