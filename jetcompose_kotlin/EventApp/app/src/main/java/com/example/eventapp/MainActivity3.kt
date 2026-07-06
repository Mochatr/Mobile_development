package com.example.eventapp

import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.AdapterView
import android.widget.ArrayAdapter
import android.widget.LinearLayout
import android.widget.Spinner
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

/**
 * Tache : OnItemSelected.
 */
class MainActivity3 : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main3)

        val root = findViewById<LinearLayout>(R.id.activity3)
        val spinnerVilles = findViewById<Spinner>(R.id.spinnerVilles)
        val textViewSelection = findViewById<TextView>(R.id.textViewSelection)

        val villes = listOf("Casablanca", "Rabat", "Mohammedia", "Marrakech", "Tanger")
        spinnerVilles.adapter = ArrayAdapter(this, android.R.layout.simple_spinner_dropdown_item, villes)

        spinnerVilles.onItemSelectedListener = object : AdapterView.OnItemSelectedListener {
            override fun onItemSelected(parent: AdapterView<*>?, view: View?, position: Int, id: Long) {
                textViewSelection.text = "Ville selectionnee : ${villes[position]}"
            }

            override fun onNothingSelected(parent: AdapterView<*>?) {}
        }

        root.setOnTouchListener(object : OnSwipeTouchListener(this) {
            override fun onSwipeLeft() {
                startActivity(Intent(this@MainActivity3, MainActivity4::class.java))
            }

            override fun onSwipeRight() {
                startActivity(Intent(this@MainActivity3, MainActivity2::class.java))
            }
        })
    }
}
