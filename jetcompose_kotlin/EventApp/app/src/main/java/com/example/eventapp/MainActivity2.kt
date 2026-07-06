package com.example.eventapp

import android.content.Intent
import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import android.widget.EditText
import android.widget.LinearLayout
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

/**
 * Tache : TextChange.
 */
class MainActivity2 : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main2)

        val root = findViewById<LinearLayout>(R.id.activity2)
        val editTextInput = findViewById<EditText>(R.id.editTextInput)
        val textViewLength = findViewById<TextView>(R.id.textViewLength)

        editTextInput.addTextChangedListener(object : TextWatcher {
            override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {}

            override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {
                textViewLength.text = "Nombre de caracteres : ${s?.length ?: 0}"
            }

            override fun afterTextChanged(s: Editable?) {}
        })

        root.setOnTouchListener(object : OnSwipeTouchListener(this) {
            override fun onSwipeLeft() {
                startActivity(Intent(this@MainActivity2, MainActivity3::class.java))
            }

            override fun onSwipeRight() {
                startActivity(Intent(this@MainActivity2, MainActivity::class.java))
            }
        })
    }
}
