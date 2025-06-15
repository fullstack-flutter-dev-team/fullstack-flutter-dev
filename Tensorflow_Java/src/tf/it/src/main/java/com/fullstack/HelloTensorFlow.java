package com.fullstack;

import org.tensorflow.Graph;
import org.tensorflow.Session;
import org.tensorflow.Tensor;
import org.tensorflow.TensorFlow;

public class HelloTensorFlow {
  public static void main(String[] args){
    try (Graph g = new Graph()) {
      final String value = "Hello from " + TensorFlow.version();

      // Construct the computation graph with a single operation, a constant
      // named "MyConst" with a value "value".
      try (Tensor t = Tensor.create(value.getBytes("UTF-8"))) {
        // The Java API doesn't yet include convenience functions for adding operations.
        g.opBuilder("Const", "MyConst").setAttr("dtype", t.dataType()).setAttr("value", t).build();
      } catch (Exception e) {
        System.err.println("Error creating tensor: " + e.getMessage());
        return;
      }

      // Execute the "MyConst" operation in a Session.
      try (Session s = new Session(g);
          // Generally, there may be multiple output tensors,
          // all of them must be closed to prevent resource leaks.
          Tensor output = s.runner().fetch("MyConst").run().get(0)) {
        System.out.println(new String(output.bytesValue(), "UTF-8"));
      } catch (Exception e) {
        System.err.println("Error executing session: " + e.getMessage());
      }
    } catch (Exception e) {
      System.err.println("Error creating graph: " + e.getMessage());
    }

    
    System.out.println("TensorFlow version: " + TensorFlow.version());

  }
}