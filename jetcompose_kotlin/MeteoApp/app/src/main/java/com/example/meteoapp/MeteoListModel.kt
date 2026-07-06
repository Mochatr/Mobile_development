package com.example.meteoapp

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ArrayAdapter
import android.widget.ImageView
import android.widget.TextView

class MeteoListModel(
    context: Context,
    private val resource: Int,
    private val listItems: List<MeteoItem>
) : ArrayAdapter<MeteoItem>(context, resource, listItems) {

    companion object {
        val images = mapOf(
            "Clear" to R.drawable.ic_weather_clear,
            "Clouds" to R.drawable.ic_weather_clouds,
            "Rain" to R.drawable.ic_weather_rain,
            "Thunderstorm" to R.drawable.ic_weather_thunderstorm
        )
    }

    override fun getView(position: Int, convertView: View?, parent: ViewGroup): View {
        val listItem = convertView
            ?: LayoutInflater.from(context).inflate(resource, parent, false)

        val imageView = listItem.findViewById<ImageView>(R.id.imageView)
        val textViewTempMax = listItem.findViewById<TextView>(R.id.textViewTempMax)
        val textViewTempMin = listItem.findViewById<TextView>(R.id.textViewTempMin)
        val textViewPression = listItem.findViewById<TextView>(R.id.textViewPression)
        val textViewHumidite = listItem.findViewById<TextView>(R.id.textViewHumidite)
        val textViewDate = listItem.findViewById<TextView>(R.id.textViewDate)

        val item = listItems[position]
        images[item.image]?.let { imageView.setImageResource(it) }
        textViewTempMax.text = "${item.tempMax} °C"
        textViewTempMin.text = "${item.tempMin} °C"
        textViewPression.text = "${item.pression} hPa"
        textViewHumidite.text = "${item.humidite} %"
        textViewDate.text = item.date

        return listItem
    }
}
