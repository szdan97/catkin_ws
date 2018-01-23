#include <ros/ros.h>
#include <beginner_tutorials/DataToAssociate.h>
#include <beginner_tutorials/Point2D.h>
#include <std_msgs/String.h>
#include <std_msgs/Int8.h>
#include <std_msgs/Int8MultiArray.h>
#include <std_msgs/Float32MultiArray.h>
#include <eigen3/Eigen/Dense>
#include <cmath>

ros::Publisher assoc_pub;

double mahalanobisDist(beginner_tutorials::Point2D point, beginner_tutorials::Point2D mu, Eigen::MatrixXd sigma) {
    auto dx = point.x - mu.x;
    auto dy = point.y - mu.y;
    Eigen::Vector2d d;
    d << dx, dy;
    double x = d.adjoint() * sigma.inverse() * d;
    return sqrt(x);
}

Eigen::MatrixXd msgMtxToEigen(std_msgs::Float32MultiArray raw) {
    Eigen::MatrixXd out(raw.layout.dim[0].size, raw.layout.dim[1].size);
    for (int i = 0; i < raw.layout.dim[0].size; ++i) {
        for (int j = 0; j < raw.layout.dim[1].size; ++j) {
            out(i, j) = raw.data[i*raw.layout.dim[0].stride + j];
        }
    }
    return out;
}

void dataCallback(const beginner_tutorials::DataToAssociate &msg) {

    //naive data association based on euclidean distance

    std_msgs::Int8MultiArray assoc;

    for (auto &&measurement : msg.measurements) {

        int associatedIndex = 0;
        int i = 0;
        auto firstFeature = *msg.features.begin();
        auto firstCov = *msg.featureCovMatrices.begin();
        double minDist = mahalanobisDist(measurement, firstFeature, msgMtxToEigen(firstCov));
        auto&& cov = msg.featureCovMatrices.begin();
        for (auto&& feature = msg.features.begin(); feature != msg.features.end(); ++feature, ++cov) {
            double dist = mahalanobisDist(measurement, *feature, msgMtxToEigen(*cov));
            if (dist < minDist) {
                minDist = dist;
                associatedIndex = i;
            }
            i++;
        }
        ROS_INFO("Assoc index: %d; Distance: %d", associatedIndex, minDist);
        assoc.data.push_back(associatedIndex);
    }

    ROS_INFO("\n");
    assoc_pub.publish(assoc);
    ros::spinOnce();
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "data_association");

    ros::NodeHandle node;
    ros::Subscriber subscriber = node.subscribe("raw_data", 1000, dataCallback);

    assoc_pub = node.advertise<std_msgs::Int8MultiArray>("associations", 1000);
    ros::Rate loop_rate(10);

    ros::spin();

    return 0;
}