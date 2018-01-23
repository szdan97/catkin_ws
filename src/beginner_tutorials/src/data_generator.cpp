#include <ros/ros.h>
#include <beginner_tutorials/DataToAssociate.h>
#include <std_msgs/Float32MultiArray.h>
#include <Eigen/Core>

template <class Derived>
void matrixEigenToMsg(const Eigen::MatrixBase<Derived> &e, std_msgs::Float32MultiArray &m)
{
    if (m.layout.dim.size() != 2)
        m.layout.dim.resize(2);
    m.layout.dim[0].stride = e.rows() * e.cols();
    m.layout.dim[0].size = e.rows();
    m.layout.dim[1].stride = e.cols();
    m.layout.dim[1].size = e.cols();
    if ((int)m.data.size() != e.size())
        m.data.resize(e.size());
    int ii = 0;
    for (int i = 0; i < e.rows(); ++i)
        for (int j = 0; j < e.cols(); ++j)
            m.data[ii++] = e.coeff(i, j);
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "data_generator");
    ros::NodeHandle n;
    ros::Publisher pub = n.advertise<beginner_tutorials::DataToAssociate>("raw_data", 1000);
    ros::Rate(10).sleep();

    Eigen::MatrixXd m(2, 2);
    m <<
      0.1, 0,
      0, 0.1;
    std_msgs::Float32MultiArray msg;
    matrixEigenToMsg(m, msg);

    int num = 5;

    beginner_tutorials::DataToAssociate data;
    srand(time(NULL));
    for (int i = 0; i < num; i++) {
        data.featureCovMatrices.push_back(msg);
        beginner_tutorials::Point2D feature, measurement;
        feature.x = i;
        feature.y = i;
        measurement.x = i + (double)rand() / RAND_MAX * 0.2 - 0.1;
        measurement.y = i + (double)rand() / RAND_MAX * 0.2 - 0.1;
        data.features.push_back(feature);
        data.measurements.push_back(measurement);
    }

    ros::Rate r(10);
    while (ros::ok()) {
        pub.publish(data);
        ros::spinOnce();
        r.sleep();
    }

}