package com.example.calculateurimc;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    private EditText poidsInput;
    private EditText tailleInput;
    private Button btnCalculer;
    private TextView textResultatImc;
    private TextView textCategorie;
    private ImageView imageCategorie;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // Charge l'interface XML
        setContentView(R.layout.activity_main);

        // Initialisation des composants UI
        poidsInput = findViewById(R.id.poidsInput);
        tailleInput = findViewById(R.id.tailleInput);
        btnCalculer = findViewById(R.id.btnCalculer);
        textResultatImc = findViewById(R.id.textResultatImc);
        textCategorie = findViewById(R.id.textCategorie);
        imageCategorie = findViewById(R.id.imageCategorie);

        // Gestion de l'événement de clic
        btnCalculer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                calculerIMC();
            }
        });
    }

    private void calculerIMC() {
        String poidsStr = poidsInput.getText().toString();
        String tailleStr = tailleInput.getText().toString();

        if (!poidsStr.isEmpty() && !tailleStr.isEmpty()) {
            double poids = Double.parseDouble(poidsStr);
            double tailleCm = Double.parseDouble(tailleStr);

            double tailleM = tailleCm / 100.0;
            double imc = poids / (tailleM * tailleM);

            textResultatImc.setText(String.format("Votre IMC est: %.2f", imc));

            if (imc < 18.5) {
                textCategorie.setText("Maigreur");
                imageCategorie.setImageResource(R.drawable.maigre);
            } else if (imc >= 18.5 && imc < 25) {
                textCategorie.setText("Normal");
                imageCategorie.setImageResource(R.drawable.normal);
            } else if (imc >= 25 && imc < 30) {
                textCategorie.setText("Surpoids");
                imageCategorie.setImageResource(R.drawable.surpoids);
            } else if (imc >= 30 && imc < 40) {
                textCategorie.setText("Obésité modérée");
                imageCategorie.setImageResource(R.drawable.obese);
            } else {
                textCategorie.setText("Obésité sévère");
                imageCategorie.setImageResource(R.drawable.t_obese);
            }
        }
    }
}