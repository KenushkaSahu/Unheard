package com.app.temperatureconverter;

import static com.app.temperatureconverter.R.id.button2;

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
EditText txt;
Button b1,b2;
    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        txt = findViewById(R.id.editTextNumber2);
        b1 = findViewById(R.id.button);
        b2 = findViewById(button2);
        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                double p1 = Double.parseDouble(txt.getText().toString());
                double k1 = ((1.8+p1) + 32);
                txt.setText(String.format("%.2f",k1));
                Toast.makeText(MainActivity.this, String.format("%.2f",k1)+" F", Toast.LENGTH_SHORT).show();
            }
        });

        b2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                double p2 = Double.parseDouble(txt.getText().toString());
                double k2 = ((p2-32)*5)/9;
                txt.setText(String.format("%.2f",k2));
                Toast.makeText(MainActivity.this, String.format("%.2f",k2)+" C", Toast.LENGTH_SHORT).show();
            }
        });
    }
}