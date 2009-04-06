function testiraj()
sched = findResource('scheduler','type','local');
job=createJob(sched)
createTask(job, @simuliraj,0,{'COM1'});
createTask(job, @accDebug,0,{'COM2'});
submit(job);
get(job,'Tasks');