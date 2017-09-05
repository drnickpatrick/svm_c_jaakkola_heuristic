#include <shark/Models/Kernels/GaussianRbfKernel.h>
#include <shark/ObjectiveFunctions/Loss/ZeroOneLoss.h>
#include <shark/ObjectiveFunctions/CrossValidationError.h>
#include <shark/Algorithms/Trainers/CSvmTrainer.h>
#include <shark/Algorithms/DirectSearch/GridSearch.h>
#include <shark/Algorithms/JaakkolaHeuristic.h>
#include <shark/Data/Dataset.h>
#include <shark/Data/DataDistribution.h>
#include <shark/Data/Libsvm.h>


using namespace shark;
using namespace std;


int main(int argc, char* argv[])
{
  if(argc != 2){
    cout<<" usage:" << endl;
    cout<<" jaakkola <svm_file>" << endl;
    return -1;
  }

  ClassificationDataset data;
  import_libsvm(data, argv[1]);

  // use Jaakkola's heuristic as a starting point for the grid-search
  JaakkolaHeuristic ja(data);
  double ljg = log(ja.gamma());
  cout << "Jaakkola:gamma = " << ja.gamma() << " sigma = " << ja.sigma() << endl;
  cerr << ja.gamma() << endl;
}
