package com.example.eventapp

import android.content.Intent
import android.os.Bundle
import android.view.MotionEvent
import android.view.View
import android.widget.FrameLayout
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

/**
 * Tache : OnTouch.
 */
class MainActivity4 : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main4)

        val touchZone = findViewById<FrameLayout>(R.id.touchZone)
        val textViewTouch = findViewById<TextView>(R.id.textViewTouch)

        val swipeListener = object : OnSwipeTouchListener(this) {
            override fun onSwipeLeft() {
                startActivity(Intent(this@MainActivity4, MainActivity5::class.java))
            }

            override fun onSwipeRight() {
                startActivity(Intent(this@MainActivity4, MainActivity3::class.java))
            }
        }

        touchZone.setOnTouchListener { v: View, event: MotionEvent ->
            textViewTouch.text = "x: ${event.x.toInt()} , y: ${event.y.toInt()}"
            swipeListener.onTouch(v, event)
        }
    }
}
