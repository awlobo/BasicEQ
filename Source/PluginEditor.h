#pragma once

#include <JuceHeader.h>
#include "PluginProcessor.h"

class BasicEQAudioProcessorEditor : public juce::AudioProcessorEditor
{
public:
	BasicEQAudioProcessorEditor(BasicEQAudioProcessor&);
	~BasicEQAudioProcessorEditor() override;

	void paint(juce::Graphics&) override;
	void resized() override;

private:
	// This reference is provided as a quick way for your editor to
	// access the processor object that created it.
	BasicEQAudioProcessor& audioProcessor;

	JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR(BasicEQAudioProcessorEditor)
};
