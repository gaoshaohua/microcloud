// package com.micro.cloud.task;
//
// import java.util.List;
// import java.util.Map;
// import java.util.concurrent.ArrayBlockingQueue;
// import java.util.concurrent.BlockingQueue;
//
// import org.gongliang.common.task.KJob;
// import org.gongliang.kit.web.SpringKit;
// import org.gongliang.sys.entity.Log;
// import org.gongliang.sys.service.LogService;
// import org.slf4j.Logger;
// import org.slf4j.LoggerFactory;
//
// import com.google.common.collect.Lists;
//
/// **
// * 日志记录任务
// */
// public class TaskLog implements KJob {
//
// private static final Logger logger = LoggerFactory.getLogger(TaskLog.class);
//
// private volatile static TaskLog singleton;
//
// public TaskLog() {
// }
//
// /**
// * 获取日志单例
// *
// * @return
// */
// public static TaskLog getSingleton() {
// if (singleton == null) {
// synchronized (TaskLog.class) {
// if (singleton == null) {
// singleton = new TaskLog();
// }
// }
// }
// return singleton;
// }
//
// /**
// * 日志记录队列
// */
// private static BlockingQueue<Log> queueLog = new ArrayBlockingQueue<Log>(
// 1000);
//
// private static LogService logService = SpringKit.getBean(LogService.class);//
// 日志服务
//
// /**
// * 添加记录
// *
// * @param o
// */
// public void add(Log log) {
// queueLog.offer(log);
// logger.info("记录了一条日志：" + log.getReqUrl());
// }
//
//
// /**
// * 将日志入库任务
// */
// @Override
// public void execute(Map<String, Object> data) {
// logger.info("执行记录日志的任务!");
// if (queueLog.size() > 0)
// logger.info("当前日志队列总数：" + queueLog.size());
// int i = 0;
// List<Log> logs = Lists.newArrayList();// 临时日志堆栈
// while (queueLog.size() > 0) {
// if (i > 1000) {
// break;
// }
// Log log = queueLog.poll();
// logs.add(log);
// i++;
// }
// if (logs.size() > 0) {
// logService.saveBatch(logs);
// logger.info("当前日志入库队列数：" + logs.size());
// }
// }
//
// }
