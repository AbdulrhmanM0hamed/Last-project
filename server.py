import tensorflow as tf
import numpy as np
from PIL import Image

# تحميل النموذج TFLite
interpreter = tf.lite.Interpreter(model_path="assets/quantized_pruned_model_melanoma.tflite")
interpreter.allocate_tensors()
# assets/quantized_pruned_model_allergy.tflite  256
# assets/quantized_pruned_model_cancer.tflite 128
# assets/quantized_pruned_model_melanoma.tflite 250
# الحصول على تفاصيل المدخلات والمخرجات
input_details = interpreter.get_input_details()
output_details = interpreter.get_output_details()

# دالة لتحضير الصورة
def preprocess_image(image_path):
    image = Image.open(image_path)
    image = image.resize((250, 250))  # التأكد من أن الأبعاد تتناسب مع النموذج المدرب
    image = np.array(image) / 255.0
    image = np.expand_dims(image, axis=0).astype(np.float32)
    return image

# قائمة الصور للاختبار
image_paths = [
    'assets/images/WhatsApp Image 2024-05-22 at 03.18.53_b6440bc1.jpg',

]

# اختبار النموذج على كل صورة
for image_path in image_paths:
    image = preprocess_image(image_path)
    interpreter.set_tensor(input_details[0]['index'], image)
    interpreter.invoke()
    output_data = interpreter.get_tensor(output_details[0]['index'])
    print(f"Prediction for {image_path}: {output_data}")
