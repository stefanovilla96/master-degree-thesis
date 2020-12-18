import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
from sklearn import metrics
import matplotlib.pyplot as plt
from sklearn.naive_bayes import GaussianNB
from sklearn.tree import DecisionTreeClassifier
from sklearn.svm import SVC
from sklearn.ensemble import RandomForestRegressor
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis
from sklearn.linear_model import LogisticRegression
from sklearn.preprocessing import StandardScaler
from sklearn.preprocessing import RobustScaler
from sklearn.metrics import classification_report, confusion_matrix, accuracy_score, precision_score
from sklearn import svm
from sklearn.decomposition import PCA
from sklearn.metrics import roc_auc_score

dataset = pd.read_csv('dataset.csv')


x = dataset.iloc[:, 1:9]
y = dataset.iloc[:, 9]

sc = StandardScaler()
x = sc.fit_transform(x)


x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.33, random_state=0)

logistic = LogisticRegression(solver='lbfgs', multi_class='auto')
logistic.fit(x_train, y_train)
y_pred = logistic.predict(x_test)
print('LOGISTIC REGRESSION: ')
print('Accuracy: ', accuracy_score(y_test, y_pred))
print(classification_report(y_test,y_pred))



"""
KNN_model = KNeighborsClassifier(n_neighbors=5)
KNN_model.fit(x_train, y_train)
y_pred = KNN_model.predict(x_test)

print('KNN: ')
print(classification_report(y_test,y_pred))
print(accuracy_score(y_test, y_pred))


svm = SVC()
svm.fit(x_train, y_train)
y_pred = svm.predict(x_test)

print('SVM: ')
print(classification_report(y_test,y_pred))
print(accuracy_score(y_test, y_pred))

logistic = LogisticRegression(solver='lbfgs', multi_class='auto')
logistic.fit(x_train, y_train)
y_pred = logistic.predict(x_test)

"""
#print(precision_score(y_test, y_pred, average='samples'))
arr = np.array([2.4749,   -0.3482,   -0.3545,   -0.3545,   -0.3545,   -0.3545,   -0.3545,   -0.3545])
arr = arr.reshape(1, -1)
arr = sc.fit_transform(arr)


print("x: ", logistic.predict(arr))
