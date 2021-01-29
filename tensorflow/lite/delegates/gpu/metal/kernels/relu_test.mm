/* Copyright 2019 The TensorFlow Authors. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
==============================================================================*/

#import <XCTest/XCTest.h>

#include <string>
#include <vector>

#include "tensorflow/lite/delegates/gpu/common/operations.h"
#include "tensorflow/lite/delegates/gpu/common/shape.h"
#include "tensorflow/lite/delegates/gpu/common/status.h"
#include "tensorflow/lite/delegates/gpu/common/tensor.h"
#include "tensorflow/lite/delegates/gpu/common/util.h"
#include "tensorflow/lite/delegates/gpu/metal/compute_task_descriptor.h"
#include "tensorflow/lite/delegates/gpu/metal/kernels/test_util.h"
#include "tensorflow/lite/delegates/gpu/common/tasks/relu_test_util.h"

@interface ReLUTest : XCTestCase
@end

@implementation ReLUTest {
  tflite::gpu::metal::MetalExecutionEnvironment exec_env_;
}

- (void)testReLUNoClipNoAlpha {
  auto status = ReLUNoClipNoAlphaTest(&exec_env_);
  XCTAssertTrue(status.ok(), @"%s", std::string(status.message()).c_str());
}

- (void)testReLUClip {
  auto status = ReLUClipTest(&exec_env_);
  XCTAssertTrue(status.ok(), @"%s", std::string(status.message()).c_str());
}

- (void)testReLUAlpha {
  auto status = ReLUAlphaTest(&exec_env_);
  XCTAssertTrue(status.ok(), @"%s", std::string(status.message()).c_str());
}

- (void)testReLUAlphaClip {
  auto status = ReLUAlphaClipTest(&exec_env_);
  XCTAssertTrue(status.ok(), @"%s", std::string(status.message()).c_str());
}

@end
