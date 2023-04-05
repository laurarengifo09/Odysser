using System.Collections;
using System.Collections.Generic;
using UnityEngine.SceneManagement;
using UnityEngine;
using UnityEngine.UI;

public class escenesChange : MonoBehaviour
{
    public string name;
    public GameObject obj;

    void Start()
    {
        obj.transform.GetComponent<Button>().onClick.AddListener(() => changeScene());
    }

    public void changeScene()
    {
        SceneManager.LoadScene(name);
    }

}
