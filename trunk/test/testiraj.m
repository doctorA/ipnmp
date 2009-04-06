function testiraj()
sched = findResource('scheduler','type','local');
job=createJob(sched)
createTask(job, @simuliraj,0,{'COM4'});
createTask(job, @accDebug,0,{'COM5'});
submit(job);
get(job,'Tasks')