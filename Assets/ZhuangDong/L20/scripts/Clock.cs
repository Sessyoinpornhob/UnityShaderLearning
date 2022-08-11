using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Clock : MonoBehaviour
{
    public Material clockMat;

    private bool valid = false;
    private int hourAnglePropID;
    private int minuteAnglePropID;
    private int secondAnglePropID;
    
    // Start is called before the first frame update
    void Start()
    {
        if (clockMat != null)
        {
            hourAnglePropID = Shader.PropertyToID("_HourHandAngle");
            minuteAnglePropID = Shader.PropertyToID("_MinuteHandAngle");
            secondAnglePropID = Shader.PropertyToID("_SecondHandAngle");

            if (clockMat.HasProperty("_HourHandAngle") &&
                clockMat.HasProperty("_MinuteHandAngle") &&
                clockMat.HasProperty("_SecondHandAngle"))
            {
                valid = true;
            }
        }
    }

    // Update is called once per frame
    void Update()
    {
        if (!valid) return;
        //处理秒针
        int second = DateTime.Now.Second;
        float secondAngle = second / 60f * 360f;
        clockMat.SetFloat(secondAnglePropID, secondAngle);
        //分针
        int minute = DateTime.Now.Minute;
        float minuteAngle = minute / 60f * 360f;
        clockMat.SetFloat(minuteAnglePropID, minuteAngle);        
        //时针
        int hour = DateTime.Now.Hour;
        float hourAngle = (hour % 12) / 12f * 360f;
        clockMat.SetFloat(hourAnglePropID, hourAngle);
        //简单捏
    }
}
