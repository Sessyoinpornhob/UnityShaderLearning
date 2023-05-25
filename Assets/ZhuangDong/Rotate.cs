using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Rotate : MonoBehaviour
{
    private float speed;

    // Update is called once per frame
    void Update()
    {
        speed += Time.deltaTime * 40;
        transform.rotation = Quaternion.Euler(0,speed,0);
    }
}
