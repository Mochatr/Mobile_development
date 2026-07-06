package com.example.meteoapp

data class MeteoItem(
    var date: String = "",
    var tempMin: Int = 0,
    var tempMax: Int = 0,
    var pression: Int = 0,
    var humidite: Int = 0,
    var image: String = ""
)
