from estnltk import Text
import sys


def process_file(orig, output):
    # write text with split roots into new file
    with open(orig, 'r', encoding='utf-8') as f:
        with open(output, 'a', encoding='utf-8') as r:
            # read line by line
            for i, line in enumerate(f):
                sent = line.strip().split(' ')
                split_sent = ''
                for word in sent:
                    if len(word) < 10:
                        # if len(word) < 10, keep it as is
                        split_sent += word + ' '
                    else:
                        # if len(word) >= 10, check for multiple roots,
                        # put whitespaces between them
                        split_sent += split_roots(word) + ' '
                r.write(split_sent + '\n')
                if i % 1000 == 0:
                    print('Processed %s lines' % i, end='\r')


def split_roots(word):
    # add whitespaces between roots of word
    text = Text(word)
    tags = text.tag_analysis()
    if len(tags['words'][0]['analysis']) == 1:
        # if only one possible analysis, remember roots
        roots = tags['words'][0]['analysis'][0]['root_tokens']
    elif len(tags['words'][0]['analysis']) > 1:
        # if multiple analyses, choose one with the least number of roots
        analyses_n_of_roots = [len(an['root_tokens']) for an in tags['words'][0]['analysis']]
        if len(set(analyses_n_of_roots)) > 1:
            right_analysis = sorted(tags['words'][0]['analysis'], key=lambda x: len(x['root_tokens']))[0]
            roots = right_analysis['root_tokens']
        else:
            roots = tags['words'][0]['analysis'][0]['root_tokens']
    if len(roots) > 1:
        # if more than one root, split by whitespaces
        roots_length = len(''.join(roots[:-1]))
        output = ' '.join(roots[:-1]) + ' ' + word[roots_length:]
        return output
    else:
        # if one root, keep word as is
        return word


if __name__ == '__main__':
    source, res = sys.argv[1], sys.argv[2]
    process_file(source, res)
