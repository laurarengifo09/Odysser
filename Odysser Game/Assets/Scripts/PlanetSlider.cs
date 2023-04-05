using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class PlanetSlider : MonoBehaviour
{
    public Scrollbar scrollBar;
    float i = 0;
    float[] pos;


    void Update()
    {
        pos = new float[transform.childCount];
        float distance = 1f / (pos.Length - 1f);

        for (int j = 0; j < pos.Length; j++)
        {
            pos[j] = distance * j;
        }
        if (Input.GetMouseButton(0)){
            i = scrollBar.value;
        }
        else
        {
            for(int j = 0; j < pos.Length; j++)
            {
                if (i < pos[j] + (distance / 2) && i > pos[j] - (distance / 2))
                    scrollBar.value = Mathf.Lerp(scrollBar.value, pos[j], 0.1f);
            }
        }

        
        for (int j = 0; j < pos.Length; j++)
        {
            if (i < pos[j] + (distance / 2) && i > pos[j] - (distance / 2))
            {
                transform.GetChild(j).localScale = Vector2.Lerp(transform.GetChild(j).localScale, new Vector2(1.4f, 1.4f), 0.1f);
                for(int k = 0; k < pos.Length; k++)
                {
                    if(k!=j)
                        transform.GetChild(k).localScale = Vector2.Lerp(transform.GetChild(k).localScale, new Vector2(1f, 1f), 0.1f);
                }
            }
        }

    }
}