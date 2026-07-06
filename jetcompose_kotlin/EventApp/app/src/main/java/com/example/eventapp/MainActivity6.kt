package com.example.eventapp

import android.app.DatePickerDialog
import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.LinearLayout
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import java.util.Calendar

/**
 * Tache : OnDateSet.
 */
class MainActivity6 : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main6)

        val root = findViewById<LinearLayout>(R.id.activity6)
        val buttonPickDate = findViewById<Button>(R.id.buttonPickDate)
        val textViewDate = findViewById<TextView>(R.id.textViewDate)

        buttonPickDate.setOnClickListener {
            val calendar = Calendar.getInstance()
            DatePickerDialog(
                this,
                { _, year, month, dayOfMonth ->
                    textViewDate.text = "Date choisie : $dayOfMonth/${month + 1}/$year"
                },
                calendar.get(Calendar.YEAR),
                calendar.get(Calendar.MONTH),
                calendar.get(Calendar.DAY_OF_MONTH)
            ).show()
        }

        root.setOnTouchListener(object : OnSwipeTouchListener(this) {
            override fun onSwipeRight() {
                startActivity(Intent(this@MainActivity6, MainActivity5::class.java))
            }
        })
    }
}
