package com.app.calcy;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import com.google.android.material.button.MaterialButton;
import org.mozilla.javascript.Context;
import org.mozilla.javascript.Scriptable;

public class MainActivity extends AppCompatActivity implements View.OnClickListener{

    TextView resultTv,solutionTv;
    MaterialButton buttonC,buttonBrackOpen,buttonBrackClose, buttonAC;
    MaterialButton buttonDivide, buttonMultiply, buttonPlus, buttonMinus, buttonEqualsTo;
    MaterialButton button0, button1, button2, button3, button4, button5, button6, button7, button8, button9, buttonDot;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        resultTv = findViewById(R.id.result_TextView);
        solutionTv = findViewById(R.id.solution_textView);

        findingId(button0,R.id.butn_zero);
        findingId(button1,R.id.butn_one);
        findingId(button2,R.id.butn_two);
        findingId(button3,R.id.butn_three);
        findingId(button4,R.id.butn_four);
        findingId(button5,R.id.butn_five);
        findingId(button6,R.id.butn_six);
        findingId(button7,R.id.butn_Seven);
        findingId(button8,R.id.butn_Eight);
        findingId(button9,R.id.butn_Nine);
        findingId(buttonDot,R.id.butn_dot);
        findingId(buttonC,R.id.butn_C);
        findingId(buttonBrackClose,R.id.butn_close_bracket);
        findingId(buttonBrackOpen,R.id.butn_open_bracket);
        findingId(buttonAC,R.id.butn_AC);
        findingId(buttonDivide,R.id.butn_divide);
        findingId(buttonMultiply,R.id.butn_Multiply);
        findingId(buttonPlus,R.id.butn_plus);
        findingId(buttonMinus,R.id.butn_minus);
        findingId(buttonEqualsTo,R.id.butn_equalTo);
    }

    public void findingId(MaterialButton btn, int id){
        btn = findViewById(id);
        btn.setOnClickListener(this);
    }

    @Override
    public void onClick(View view) {
        MaterialButton button = (MaterialButton) view;
        String buttonText = button.getText().toString();
        String dataToCal = solutionTv.getText().toString();

        if(buttonText.equals("AC")){
            solutionTv.setText("");
            resultTv.setText("0");
            return;
        }
        if(buttonText.equals("=")){
            solutionTv.setText(resultTv.getText());
            return;
        }
        if(buttonText.equals("C")){
            dataToCal = dataToCal.substring(0,dataToCal.length()-1);
        } else{
            dataToCal = dataToCal+buttonText;
        }

        solutionTv.setText(dataToCal);

        String finalResult = getResult(dataToCal);

        if(!finalResult.equals("Error")){
            resultTv.setText(finalResult);
        } else{
            resultTv.setText("0");
        }
    }

    String getResult(String data){
        try{
            Context context = Context.enter();
            context.setOptimizationLevel(-1);
            Scriptable scriptable = context.initStandardObjects();
            String finalResult = context.evaluateString(scriptable,data,"Javascript",1,null).toString();
            if(finalResult.endsWith(".0")){
                finalResult = finalResult.replace(".0","");
            }
            return  finalResult;
        } catch (Exception e){
            return "Error";
        }
    }
}