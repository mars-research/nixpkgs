{ lib
, buildPythonPackage
, fetchPypi
}:

buildPythonPackage rec {
  pname = "types-setuptools";
  version = "62.6.0";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-x3oytRZ7ng2Zwfezm39aPsABxxCZMd1jxRZS+eRmPQc=";
  };

  # Module doesn't have tests
  doCheck = false;

  pythonImportsCheck = [
    "setuptools-stubs"
  ];

  meta = with lib; {
    description = "Typing stubs for setuptools";
    homepage = "https://github.com/python/typeshed";
    license = licenses.asl20;
    maintainers = with maintainers; [ fab ];
  };
}
