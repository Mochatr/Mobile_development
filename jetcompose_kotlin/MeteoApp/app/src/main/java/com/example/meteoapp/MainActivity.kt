package com.example.meteoapp

import android.os.Bundle
import android.widget.EditText
import android.widget.ImageButton
import android.widget.ListView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.android.volley.Request
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import org.json.JSONObject
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

/**
 * Activite n2 : Meteo. Saisie d'une ville, appel a l'API REST OpenWeather,
 * affichage des previsions (date, temp min/max, pression, humidite).
 */
class MainActivity : AppCompatActivity() {

    private lateinit var editTextVille: EditText
    private lateinit var listViewMeteo: ListView
    private lateinit var buttonOK: ImageButton

    private val data = mutableListOf<MeteoItem>()
    private lateinit var model: MeteoListModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        editTextVille = findViewById(R.id.editTextVille)
        listViewMeteo = findViewById(R.id.listViewMeteo)
        buttonOK = findViewById(R.id.buttonOK)

        model = MeteoListModel(this, R.layout.list_item_layout, data)
        listViewMeteo.adapter = model

        buttonOK.setOnClickListener {
            val ville = editTextVille.text.toString()
            if (ville.isBlank()) {
                Toast.makeText(this, "Veuillez saisir une ville", Toast.LENGTH_SHORT).show()
                return@setOnClickListener
            }
            chargerMeteo(ville)
        }
    }

    private fun chargerMeteo(ville: String) {
        data.clear()
        model.notifyDataSetChanged()

        val apiKey = BuildConfig.OPENWEATHER_API_KEY
        val queue = Volley.newRequestQueue(applicationContext)
        val url = "https://api.openweathermap.org/data/2.5/forecast?q=$ville&appid=$apiKey"

        val stringRequest = StringRequest(
            Request.Method.GET, url,
            { response -> onMeteoResponse(response) },
            { Toast.makeText(this, "Connection problem!", Toast.LENGTH_SHORT).show() }
        )

        queue.add(stringRequest)
    }

    private fun onMeteoResponse(response: String) {
        val jsonObject = JSONObject(response)
        val jsonArray = jsonObject.getJSONArray("list")
        val sdf = SimpleDateFormat("dd-MMM-yyyy'T'HH:mm", Locale.FRENCH)

        for (i in 0 until jsonArray.length()) {
            val d = jsonArray.getJSONObject(i)
            val date = Date(d.getLong("dt") * 1000)
            val main = d.getJSONObject("main")
            val weather = d.getJSONArray("weather")

            val meteoItem = MeteoItem(
                date = sdf.format(date),
                tempMin = (main.getDouble("temp_min") - 273.15).toInt(),
                tempMax = (main.getDouble("temp_max") - 273.15).toInt(),
                pression = main.getInt("pressure"),
                humidite = main.getInt("humidity"),
                image = weather.getJSONObject(0).getString("main")
            )
            data.add(meteoItem)
        }
        model.notifyDataSetChanged()
    }
}
