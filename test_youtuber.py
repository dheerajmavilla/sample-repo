import unittest
import xmlrunner
from youtuber import YouTuber

class TestYouTuber(unittest.TestCase):

	def test_init_class_no_args(self):
		with self.assertRaises(TypeError):
			YouTuber()

	def test_init_class_with_args(self):
		youtuber = YouTuber('AllThingsAutomated', 'https://youtube.com/ATA')
		self.assertEqual('AllThingsAutomated', youtuber.get_name())
		self.assertEqual('https://youtube.com/ATA', youtuber.get_channel())

if __name__ == '__main__':
	unittest.main(testRunner=xmlrunner.XMLTestRunner(output='./test_results'))

print("cook")
