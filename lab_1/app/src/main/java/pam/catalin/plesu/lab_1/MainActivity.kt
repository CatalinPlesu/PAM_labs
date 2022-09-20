package pam.catalin.plesu.lab_1

import android.app.DatePickerDialog
import androidx.appcompat.app.AppCompatActivity
import android.widget.*
import android.os.Bundle
import android.view.View
import java.util.*
import kotlin.random.Random

var ddd = -1;
var mmm = -1;
var yyy = -1;

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)


    }

    fun openDatePicker(view: View) {
        var calendar: Calendar = Calendar.getInstance();
        var calendar2: Calendar = Calendar.getInstance();
        val birthDate = findViewById<TextView>(R.id.textViewBD);
        val age = findViewById<TextView>(R.id.textViewAGE);

        var cyy = calendar.get(Calendar.YEAR);
        var cmm = calendar.get(Calendar.MONTH);
        var cdd = calendar.get(Calendar.DATE);

        DatePickerDialog(this,
            DatePickerDialog.OnDateSetListener{datePicker, yy, mm, dd ->
                ddd = dd; mmm = mm; yyy = yy;

                yyy = cyy - yyy;
                if(mm<=cmm){
                    mmm = cmm - mmm;
                }else{
                    mmm = 12 - mmm;
                    yyy -= 1;
                }
                if(ddd<=cdd){
                    ddd = cdd - ddd;
                }else{
                    ddd = 31 - ddd;
                }
                if(dd>=cdd && mm >=cmm && yy >= cyy){
                    ddd = 0; mmm = 0; yyy = 0;
                }

                birthDate.text = "Birth date: ${if(dd<10) 0 else ""}$dd.${if(mm+1<10) 0 else ""}${mm+1}.$yy";
                age.text = "Your age is: ${yyy} Years; ${mmm} Months; ${ddd} Days";

                ddd = dd; mmm = mm; yyy = yy;
            }, if(yyy>0) yyy else cyy, if(mmm>0) mmm else cmm, if(ddd > 0) ddd else cdd
       ).show();
    }
}