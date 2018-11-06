using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;


[RequireComponent (typeof (NavMeshAgent))]
public class Enermy : LivingEntity
{

    NavMeshAgent pathFinder;
    Transform target;

    protected override void Start () {
        base.Start();
        pathFinder = GetComponent<NavMeshAgent>();
        target = GameObject.FindWithTag("Player").transform;

        StartCoroutine(UpdatePath());
	}
	
	void Update () {
	}

    IEnumerator UpdatePath()
    {
        float refreshRate = 1;

        while (target != null)
        {
            Vector3 targetPosition = new Vector3(target.position.x, 0, target.position.z);
            if (!isDead)
            {
                pathFinder.SetDestination(targetPosition);
            }            
            yield return new WaitForSeconds(refreshRate);
        }
    }
}
