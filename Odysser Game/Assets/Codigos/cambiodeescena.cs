using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class cambiodeescena : MonoBehaviour
{

    public GameObject siguiente;
    public GameObject esta;

    // Start is called before the first frame update
    void Start()
    {
        StartCoroutine(cambio());
    }

    // Update is called once per frame
public void salir()
{
    Application.Quit();
}

    IEnumerator cambio()
    {
        yield return new WaitForSeconds(40);
        siguiente.SetActive(true);
        esta.SetActive(false);
    }
}
