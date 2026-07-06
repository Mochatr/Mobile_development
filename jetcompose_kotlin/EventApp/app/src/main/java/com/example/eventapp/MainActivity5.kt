package com.example.eventapp

import android.content.Intent
import android.os.Bundle
import android.view.ContextMenu
import android.view.MenuItem
import android.view.View
import android.widget.LinearLayout
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

/**
 * Tache : CreateContextMenu.
 */
class MainActivity5 : AppCompatActivity() {

    private lateinit var textViewResult: TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main5)

        val root = findViewById<LinearLayout>(R.id.activity5)
        val textViewItem = findViewById<TextView>(R.id.textViewItem)
        textViewResult = findViewById(R.id.textViewResult)

        registerForContextMenu(textViewItem)

        root.setOnTouchListener(object : OnSwipeTouchListener(this) {
            override fun onSwipeLeft() {
                startActivity(Intent(this@MainActivity5, MainActivity6::class.java))
            }

            override fun onSwipeRight() {
                startActivity(Intent(this@MainActivity5, MainActivity4::class.java))
            }
        })
    }

    override fun onCreateContextMenu(menu: ContextMenu, v: View, menuInfo: ContextMenu.ContextMenuInfo?) {
        super.onCreateContextMenu(menu, v, menuInfo)
        menuInflater.inflate(R.menu.context_menu, menu)
    }

    override fun onContextItemSelected(item: MenuItem): Boolean {
        textViewResult.text = "Choix : ${item.title}"
        return true
    }
}
